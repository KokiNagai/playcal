class NormalsController < ApplicationController
  before_action :authenticate_user!, only: [:message, :setting]
  before_action :new_user

  def home
    @posts = Post.where(term: true).order("RANDOM()")
    @chatboxes = Chatbox.where(touropen: true).where.not(tourgrade: nil).limit(8)
    if user_signed_in?
      @post = current_user.posts.build
      @user = User.find_by(name: params[:name])
      @chatboxes = Chatbox.where(touropen: true).where.not(chatname: "総合テニスチャットカフェ").limit(8)
      @posts = Post.where(prefecture: current_user.live)
      @posts2 = Post.where(term: true).order("RANDOM()").limit(8)
    end
  end

  # チャットカフェページ
  def tourlist
    @chatboxes = Chatbox.where(touropen: true).where.not(chatname: "総合テニスチャットカフェ").limit(5)
    @chatboxes1 = Chatbox.where(touropen: false).where.not(chatname: "総合テニスチャットカフェ").order(created_at: :desc).limit(5)
  end

  # 投稿一覧画面
  def find
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @q = Post.search(params[:q])
  end
  
  # 検索後画面
  def search
    if user_signed_in?
      @post = current_user.posts.build
      hash = gender_params
      hash1 = playday_params
      hash2 = playday_params2
      hash3 = prefecture_params
      hash4 = city_params
      hash5 = style_params
      @gender = hash.values.first
      @start_date = hash1.values.first
      @start_date2 = hash1.values.second
      @start_date3 = hash1.values.third
      @end_date = hash2.values.first
      @end_date2 = hash2.values.second
      @end_date3 = hash2.values.third
      @prefectures = hash3.values.first
      @word = hash4.values.first
      @style = hash5.values.first
      @q = Post.search(search_params)
      @posts = @q.result.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    else
      hash = gender_params
      hash1 = playday_params
      hash2 = playday_params2
      hash3 = prefecture_params
      hash4 = city_params
      hash5 = style_params
      @gender = hash.values.first
      @start_date = hash1.values.first
      @start_date2 = hash1.values.second
      @start_date3 = hash1.values.third
      @end_date = hash2.values.first
      @end_date2 = hash2.values.second
      @end_date3 = hash2.values.third
      @prefectures = hash3.values.first
      @word = hash4.values.first
      @style = hash5.values.first
      @q = Post.search(search_params)
      @posts = @q.result.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
     end
    end
    
    private
    def search_params
      params.require(:q).permit(:gender_eq,  :playday_gteq, :playday_lteq, :prefecture_eq, :style_eq, :city_cont)
    end

    def city_params
      params.require(:q).permit(:city_cont)
    end

    def gender_params
      params.require(:q).permit(:gender_eq)
    end

    def style_params
      params.require(:q).permit(:style_eq)
    end

    def playday_params
      params.require(:q).permit(:playday_gteq)
    end

    def playday_params2
      params.require(:q).permit(:playday_lteq)
    end
  
  def prefecture_params
      params.require(:q).permit(:prefecture_eq)
  end
  
  # プロフィール完成前アクセス拒否
  def new_user
    if user_signed_in?
      unless current_user.gender.present?
        redirect_to edit_user_registration_path
        flash[:alert] = "※ プロフィールの編集を完了してください。"
      end
    end
  end

end
