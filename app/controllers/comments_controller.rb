class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :destroy]
  after_action :create_notifications, only: [:create]
  before_action :new_user


  def show
  end


  def new
    @comment = Comment.new
  end


  def create
    @comment = current_user.comments.build(comment_params)
    @comment.room.touch
    if @comment.save
      redirect_to request.referrer || root_url
    end

  end


  def destroy
    @comment.destroy
    redirect_to request.referrer || root_url
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body, :from_id, :to_id, :room_id)
    end

    def create_notifications
      @room = Room.find_by(id: @comment.room_id)

      if @comment.post.user == current_user
        @room = Room.find_by(id: @comment.room_id)
      Notification.create(user_id: @room.user_id, notified_by_id: current_user.id, post_id: @room.post.id, notified_type: 'コメント')
    end

    if @comment.post.user != current_user
      @post = @comment.post
      Notification.create(user_id: @post.user.id, notified_by_id: current_user.id, post_id: @post.id, notified_type: 'コメント')
    end
  end

  def new_user
    if user_signed_in?
    unless current_user.gender.present?
    redirect_to edit_path
    flash[:alert] = "※ プロフィールの編集を完了してください。"
  end
  end
  end

end
