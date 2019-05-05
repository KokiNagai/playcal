class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox
  has_many :goods, dependent: :destroy
  
  validates :text, presence: true

  def good_user(user_id)
    goods.find_by(user_id: user_id)
  end
end
