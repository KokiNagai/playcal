class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create]


  def create
    @chat = Chat.create(chat_params)
    if @chat.save
      redirect_to request.referrer || root_url
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:user_id, :chatbox_id, :text)
  end
end
