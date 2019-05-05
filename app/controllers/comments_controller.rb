class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :destroy]
  after_action :create_notifications, only: [:create]
  before_action :new_user

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.room.touch
    @comment.save ? redirect_to request.referrer || root_url : redirect_to request.referrer || root_url
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

    # 通知作成
    def create_notifications
      if @comment.post.user == current_user && @comment.body.present?
        @room = Room.find_by(id: @comment.room_id)
        Notification.create(user_id: @room.user_id, notified_by_id: current_user.id, post_id: @room.post.id, notified_type: 'コメント')
      end
    if @comment.post.user != current_user && @comment.body.present?
      @post = @comment.post
      Notification.create(user_id: @post.user.id, notified_by_id: current_user.id, post_id: @post.id, notified_type: 'コメント')
    end
  end

  # プロフィール完成前アクセス拒否
  def new_user
    if user_signed_in?
      unless current_user.gender.present?
        redirect_to edit_user_registration_path
        flash[:alert] = "※ プロフィールの編集を完了してください。"
      end
    end
  end

end
