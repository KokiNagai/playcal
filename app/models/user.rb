class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :rooms, dependent: :destroy
    has_many :notifications, dependent: :dependent => :nullify
    has_many :likes, dependent: :destroy
    has_many :reports, dependent: :destroy
    has_many :chats, dependent: :destroy
    has_many :goods, dependent: :destroy
    has_many :from_comments, class_name: "Comment", foreign_key: "from_id", dependent: :destroy
    has_many :to_comments, class_name: "Comment", foreign_key: "to_id", dependent: :destroy

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :confirmable, :lockable, :timeoutable, :omniauthable




   mount_uploader :picture, PictureUploader
   validates :introduction, length: {maximum: 200}

   with_options on: :update do
   validates :name, presence: true, length: {maximum: 20}, uniqueness: true
   validates :live, presence: true
   validates :password, presence: true, length: { minimum: 7 }, unless: :snslogin_edit1
   validates :password, presence: true, length: { minimum: 7 }, allow_nil: true, unless: :snslogin_edit
   validates :email, presence: true, length: { maximum: 255 }
   validates :gender, presence: true
 end

 def snslogin_edit
   return true if self.uid.present? && self.gender.nil?
   false
 end

 def snslogin_edit1
   return true if self.gender.present?
   false
 end

   def self.find_for_oauth(auth)
   user = User.where(uid: auth.uid, provider: auth.provider, email: auth.info.email).first
   user1 = User.where(uid: nil, provider: nil, email: auth.info.email).first
   user2 = User.where.not(uid: nil, provider: nil).where(email: auth.info.email).first

   if !user && !user1 && !user2
     user = User.new(
       uid:      auth.uid,
       provider: auth.provider,
       email:    auth.info.email,
       name: auth.info.name,
       password: Devise.friendly_token[0, 20]
     )
     user.skip_confirmation!
     user.save
   elsif user1 || user2
     user = User.where(email: auth.info.email).first
     user.update(uid: auth.uid, provider: auth.provider)
   end
   user
 end

 def update_without_current_password(params, *options)
     params.delete(:current_password)

     if params[:password].blank? && params[:password_confirmation].blank?
       params.delete(:password)
       params.delete(:password_confirmation)
     end

     result = update_attributes(params, *options)
     clean_up_passwords
     result
   end

   def to_param
     name
   end

   attr_accessor :current_password

   private



 end
