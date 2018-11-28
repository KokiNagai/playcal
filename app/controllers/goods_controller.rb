class GoodsController < ApplicationController
  before_action :set_chat
  before_action :new_user
  before_action :authenticate_user!
  
  def create
    @good = Good.create(user_id: current_user.id, chat_id: params[:chat_id])
    @chat.reload
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, chat_id: params[:chat_id])
    @good.destroy
    @chat.reload
  end

  private

  def set_chat
  @chat = Chat.find(params[:chat_id])
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
