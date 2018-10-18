class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox

  validates :text, presence: true
end
