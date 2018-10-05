class NormalsController < ApplicationController


  def home
    if logged_in?
    @post = current_user.posts.build
    @user = User.find_by(params[:id])
  end
  end


  def about
  end

  def inquiry
  end

  def find
    @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    @member_nunber = [["1人", "1人"],["2人","2人"],["3人","3人"],["4人","4人"],["5人","5人"],["6人", "6人"],["それ以上","それ以上"]]
    @prefecture = [['北海道',   '北海道'],
         ['青森県',    '青森県'],
         ['岩手県',   '岩手県'],
         ['宮城県',   '宮城県'],
         ['秋田県',   '秋田県'],
         ['山形県',   '山形県'],
         ['福島県',   '福島県'],
         ['茨城県',    '茨城県'],
         ['栃木県',   '栃木県'],
         ['群馬県',   '群馬県'],
         ['埼玉県',   '埼玉県'],
         ['千葉県',   '千葉県'],
         ['東京都',   '東京都'],
         ['神奈川県','神奈川県'],
         ['新潟県',    '新潟県'],
         ['富山県',   '富山県'],
         ['石川県',   '石川県'],
         ['福井県',   '福井県'],
         ['山梨県',   '山梨県'],
         ['長野県',   '長野県'],
         ['岐阜県',   '岐阜県'],
         ['静岡県',   '静岡県'],
         ['愛知県',   '愛知県'],
         ['三重県',    '三重県'],
         ['滋賀県',   '滋賀県'],
         ['京都府',   '京都府'],
         ['大阪府',   '大阪府'],
         ['兵庫県',   '兵庫県'],
         ['奈良県',   '奈良県'],
         ['和歌山県', '和歌山県'],
         ['鳥取県',    '鳥取県'],
         ['島根県',   '島根県'],
         ['岡山県',   '岡山県'],
         ['広島県',   '広島県'],
         ['山口県',   '山口県'],
         ['徳島県',    '徳島県'],
         ['香川県',   '香川県'],
         ['愛媛県',   '愛媛県'],
         ['高知県',   '高知県'],
         ['福岡県',    '福岡県'],
         ['佐賀県',   '佐賀県'],
         ['長崎県',   '長崎県'],
         ['熊本県',   '熊本県'],
         ['大分県',   '大分県'],
         ['宮崎県',   '宮崎県'],
         ['鹿児島県', '鹿児島県'],
         ['沖縄県', '沖縄県'],]

         @q = Post.search(params[:q])
         @posts = @q.result.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
end

def search
  if logged_in?
  @post = current_user.posts.build
  @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  @member_nunber = [["1人", "1人"],["2人","2人"],["3人","3人"],["4人","4人"],["5人","5人"],["6人", "6人"],["それ以上","それ以上"]]
  @prefecture = [['北海道',   '北海道'],
       ['青森県',    '青森県'],
       ['岩手県',   '岩手県'],
       ['宮城県',   '宮城県'],
       ['秋田県',   '秋田県'],
       ['山形県',   '山形県'],
       ['福島県',   '福島県'],
       ['茨城県',    '茨城県'],
       ['栃木県',   '栃木県'],
       ['群馬県',   '群馬県'],
       ['埼玉県',   '埼玉県'],
       ['千葉県',   '千葉県'],
       ['東京都',   '東京都'],
       ['神奈川県','神奈川県'],
       ['新潟県',    '新潟県'],
       ['富山県',   '富山県'],
       ['石川県',   '石川県'],
       ['福井県',   '福井県'],
       ['山梨県',   '山梨県'],
       ['長野県',   '長野県'],
       ['岐阜県',   '岐阜県'],
       ['静岡県',   '静岡県'],
       ['愛知県',   '愛知県'],
       ['三重県',    '三重県'],
       ['滋賀県',   '滋賀県'],
       ['京都府',   '京都府'],
       ['大阪府',   '大阪府'],
       ['兵庫県',   '兵庫県'],
       ['奈良県',   '奈良県'],
       ['和歌山県', '和歌山県'],
       ['鳥取県',    '鳥取県'],
       ['島根県',   '島根県'],
       ['岡山県',   '岡山県'],
       ['広島県',   '広島県'],
       ['山口県',   '山口県'],
       ['徳島県',    '徳島県'],
       ['香川県',   '香川県'],
       ['愛媛県',   '愛媛県'],
       ['高知県',   '高知県'],
       ['福岡県',    '福岡県'],
       ['佐賀県',   '佐賀県'],
       ['長崎県',   '長崎県'],
       ['熊本県',   '熊本県'],
       ['大分県',   '大分県'],
       ['宮崎県',   '宮崎県'],
       ['鹿児島県', '鹿児島県'],
       ['沖縄県', '沖縄県'],]

       hash = gender_params
       hash1 = playday_params
       hash2 = playday_params2
       hash3 = prefecture_params
       hash4 = city_params

         @gender = hash.values.first
         @start_date = hash1.values.first
         @start_date2 = hash1.values.second
         @start_date3 = hash1.values.third
         @end_date = hash2.values.first
         @end_date2 = hash2.values.second
         @end_date3 = hash2.values.third
         @prefectures = hash3.values.first
         @word = hash4.values.first

       @q = Post.search(search_params)
       @posts = @q.result.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
else
  @posts = Post.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  @member_nunber = [["1人", "1人"],["2人","2人"],["3人","3人"],["4人","4人"],["5人","5人"],["6人", "6人"],["それ以上","それ以上"]]
  @prefecture = [['北海道',   '北海道'],
       ['青森県',    '青森県'],
       ['岩手県',   '岩手県'],
       ['宮城県',   '宮城県'],
       ['秋田県',   '秋田県'],
       ['山形県',   '山形県'],
       ['福島県',   '福島県'],
       ['茨城県',    '茨城県'],
       ['栃木県',   '栃木県'],
       ['群馬県',   '群馬県'],
       ['埼玉県',   '埼玉県'],
       ['千葉県',   '千葉県'],
       ['東京都',   '東京都'],
       ['神奈川県','神奈川県'],
       ['新潟県',    '新潟県'],
       ['富山県',   '富山県'],
       ['石川県',   '石川県'],
       ['福井県',   '福井県'],
       ['山梨県',   '山梨県'],
       ['長野県',   '長野県'],
       ['岐阜県',   '岐阜県'],
       ['静岡県',   '静岡県'],
       ['愛知県',   '愛知県'],
       ['三重県',    '三重県'],
       ['滋賀県',   '滋賀県'],
       ['京都府',   '京都府'],
       ['大阪府',   '大阪府'],
       ['兵庫県',   '兵庫県'],
       ['奈良県',   '奈良県'],
       ['和歌山県', '和歌山県'],
       ['鳥取県',    '鳥取県'],
       ['島根県',   '島根県'],
       ['岡山県',   '岡山県'],
       ['広島県',   '広島県'],
       ['山口県',   '山口県'],
       ['徳島県',    '徳島県'],
       ['香川県',   '香川県'],
       ['愛媛県',   '愛媛県'],
       ['高知県',   '高知県'],
       ['福岡県',    '福岡県'],
       ['佐賀県',   '佐賀県'],
       ['長崎県',   '長崎県'],
       ['熊本県',   '熊本県'],
       ['大分県',   '大分県'],
       ['宮崎県',   '宮崎県'],
       ['鹿児島県', '鹿児島県'],
       ['沖縄県', '沖縄県'],]

       hash = gender_params
       hash1 = playday_params
       hash2 = playday_params2
       hash3 = prefecture_params
       hash4 = city_params

         @gender = hash.values.first
         @start_date = hash1.values.first
         @start_date2 = hash1.values.second
         @start_date3 = hash1.values.third
         @end_date = hash2.values.first
         @end_date2 = hash2.values.second
         @end_date3 = hash2.values.third
         @prefectures = hash3.values.first
         @word = hash4.values.first

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

def playday_params
    params.require(:q).permit(:playday_gteq)
end

def playday_params2
    params.require(:q).permit(:playday_lteq)
end

def prefecture_params
    params.require(:q).permit(:prefecture_eq)
end




end
