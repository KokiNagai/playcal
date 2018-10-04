class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:create, :new, :destroy]


  def show
  end


  def new
    @comment = Comment.new
  end


  def create
    @comment = current_user.comments.build(comment_params)
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

end
