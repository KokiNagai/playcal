class RoomsController < ApplicationController
  before_action :logged_in_user, only: [:show, :create, :destroy]

  def show
    @post = current_user.posts.build
    @user = current_user
    @room = Room.find(params[:id])
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
  end

 private

  def rooms_params
    params.require(:room).permit(:from_id, :to_id, :post_id, :user_id)
  end

end
