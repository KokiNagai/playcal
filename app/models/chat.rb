class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox
  has_many :goods, dependent: :destroy

  def good_user(user_id)
    goods.find_by(user_id: user_id)
  end


  validates :text, presence: true
end
