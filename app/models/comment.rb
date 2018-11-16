class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post
    belongs_to :room

    validates :body, presence: true
end
