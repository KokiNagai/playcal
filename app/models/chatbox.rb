class Chatbox < ApplicationRecord
  has_many :chats, dependent: :destroy
end
