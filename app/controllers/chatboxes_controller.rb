class ChatboxesController < ApplicationController
  before_action :new_user

  def chatbox
    @chatbox = Chatbox.find_by(chatname: params[:chatname])
    @chats = Chat.where(chatbox_id: @chatbox.id).order(created_at: :ASC)
    if user_signed_in?
    @chat = current_user.chats.build(chatbox_id: @chatbox.id, user_id: current_user.id)
  end
end

private

ef new_user
  if user_signed_in?
  unless current_user.gender.present?
  redirect_to edit_path
  flash[:alert] = "※ プロフィールの編集を完了してください。"
end
end
end


end
