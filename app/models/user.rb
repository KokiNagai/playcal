class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :rooms, dependent: :destroy
    has_many :notifications, dependent: :destroy
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
   validates :gender, presence: true
   validates :password, presence: true, length: { minimum: 7 }, unless: :snslogin_edit1
   validates :password, presence: true, length: { minimum: 7 }, allow_nil: true, unless: :snslogin_edit
   validates :email, presence: true, length: { maximum: 255 }
 end

    enum live: {北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7, 茨城県: 8,
      栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14, 新潟県: 15, 富山県: 16,
      石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20, 岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
      滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30, 鳥取県: 31, 島根県: 32,
      岡山県: 33, 広島県: 34, 山口県: 35, 徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39, 福岡県: 40,
      佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46, 沖縄県: 47}

    enum history: {１年未満: 1, １年〜５年: 2, ５年〜１０年: 3, １０年以上: 4}

    enum gender: {男性: 1, 女性: 2}

 def snslogin_edit
   return true if self.uid.present? && self.gender.nil?
   false
 end

 def snslogin_edit1
   return true if self.gender.present? || self.live.present?
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
 end
