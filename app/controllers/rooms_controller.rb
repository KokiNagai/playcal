class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :destroy]
  before_action :correct_params, only: [:show]
  before_action :new_user

  def show
    @post = current_user.posts.build
    @user = current_user
    @room = Room.find(params[:id])
    @report = current_user.reports.build(user_id: current_user.id)
    if @room.user_id  == current_user.id || @room.to_id == current_user.id
      @comments = @room.comments.includes(:user).all
      @comment = @room.comments.build(user_id: current_user.id, post_id: @room.post.id) if current_user
    else
      redirect_to root_path
    end
  end

  def create
    @room = current_user.rooms.build(rooms_params)
    if @room.save
      redirect_to @room
    else
      render root_path
    end
  end

  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    redirect_to current_user
  end

 private
  def rooms_params
    params.require(:room).permit(:from_id, :to_id, :post_id, :user_id)
  end

  def correct_params
    @room = Room.find_by(id: params[:id])
    redirect_to root_path unless (@room.from_id == current_user.id && @room.to_id != current_user.id) || (@room.from_id != current_user.id && @room.to_id == current_user.id)
  end

  def new_user
    if user_signed_in?
    unless current_user.gender.present?
      redirect_to edit_user_registration_pathd
      flash[:alert] = "※ プロフィールの編集を完了してください。"
    end
  end
end
end
