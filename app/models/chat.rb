class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox
  has_many :goods

  validates :text, presence: true
end
