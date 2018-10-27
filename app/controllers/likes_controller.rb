class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :new_user

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    if @like.save
      redirect_to("/posts/#{params[:post_id]}")
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    if @like.destroy
      redirect_to("/posts/#{params[:post_id]}")
    end
  end

  def new_user
    if user_signed_in?
    unless current_user.gender.present?
    redirect_to edit_user_registration_path
    flash[:alert] = "※ プロフィールの編集を完了してください。"
  end
  end
  end

end
