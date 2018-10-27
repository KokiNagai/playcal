class GoodsController < ApplicationController
  before_action :set_chat
  before_action :new_user
  def create
    @good = Good.create(user_id: current_user.id, chat_id: params[:chat_id])
    @goods = Good.where(chat_id: params[:chat_id])
    @chat.reload
    @chats = Chat.all
  end

  def destroy
    good = Good.find_by(user_id: current_user.id, chat_id: params[:chat_id])
    good.destroy
    @goods = Good.where(chat_id: params[:chat_id])
    @chat.reload
  end

  private

  def set_chat
  @chat = Chat.find(params[:chat_id])
  @id_name = "#good-link-#{@chat.id}"
  @id_good = "#good-#{@chat.id}"
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
