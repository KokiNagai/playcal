class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :rooms, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :reports, dependent: :destroy
    has_many :chats, dependent: :destroy

    has_many :from_comments, class_name: "Comment", foreign_key: "from_id", dependent: :destroy
    has_many :to_comments, class_name: "Comment", foreign_key: "to_id", dependent: :destroy

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :confirmable, :lockable, :timeoutable


   mount_uploader :picture, PictureUploader
   validates :name, presence: true, length: {maximum: 15}
   validates :password, presence: true, length: { minimum: 7 }, allow_nil: true
   validates :email, presence: true, length: { maximum: 255 }
   validates :live, presence: true
   validates :gender, presence: true

   validates :introduction, length: {maximum: 200}

   def to_param
    name
  end
  end
