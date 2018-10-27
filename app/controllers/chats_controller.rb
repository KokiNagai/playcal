class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :new_user


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

  def new_user
    if user_signed_in?
    unless current_user.gender.present?
    redirect_to edit_path
    flash[:alert] = "※ プロフィールの編集を完了してください。"
  end
  end
  end

end
