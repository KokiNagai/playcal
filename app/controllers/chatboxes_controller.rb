class ChatboxesController < ApplicationController

  def chatbox
    @chatbox = Chatbox.find_by(chatname: params[:chatname])
    @chats = Chat.where(chatbox_id: @chatbox.id)
    if user_signed_in?
    @chat = current_user.chats.build(chatbox_id: @chatbox.id, user_id: current_user.id)
  end
end

end
