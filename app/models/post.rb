class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :rooms, dependent: :destroy


  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 200}
  validates :prefecture, presence: true
  validates :title, presence: true, length: {maximum: 35}
  validates :city, presence: true, length: {maximum: 20}
  validates :gender, presence: true
  validates :style, presence: true
  validates :playday, presence: true





end
