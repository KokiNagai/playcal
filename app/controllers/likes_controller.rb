class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :new_user
  before_action :set_likes

  # post like_to_post by ajax
  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    NotificationMailer.send_like_to_user(@like.post.user).deliver_later
    @post.reload
  end

  # post delete_from_post by ajax
  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    @post.reload
  end

  private
  def set_likes
    @post = Post.find(params[:post_id])
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
