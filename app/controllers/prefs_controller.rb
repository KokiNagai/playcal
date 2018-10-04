class PrefsController < ApplicationController
  protect_from_forgery except: :search # searchアクションを除外

  # GET /prefs
  # GET /prefs.json
  def index
    @prefs = Pref.all
  end

  # GET /prefs/1
  # GET /prefs/1.json
  def show
    @all = Post.all
    @pref = Pref.find(params[:id])
     if Post.where(prefecture: @pref.name).empty?
       @posts = Post.all
       @message = "投稿はありません"
     else
       @posts = Post.where(prefecture: @pref.name).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

    @post = current_user.posts.build
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

         @search = Post.search(params[:q])
         @tennis = @search.result.paginate(page: params[:page])
end

  def search
    @posts = Post.all.paginate(page: params[:page], per_page: 10)
    @post = current_user.posts.build

    if request.post?
      fstr = "%#{params[:fstr]}%"
      member = params[:member]
      @word = params[:fstr]
      @posts = Post.where("city like ?", fstr).where(member: member).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      if fstr.empty?
        @posts = Post.where(member: member).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      elsif member.empty?
        @posts = Post.where("city like ?", fstr).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
      elsif fstr.empty? && member.empty?
      @posts = Post.all.paginate(page: params[:page], per_page: 10)
    end
    end
  end




  # GET /prefs/new
  def new
    @pref = Pref.new
  end



  def edit
    @all = Post.all
    @pref = Pref.find(params[:id])
     if Post.where(prefecture: @pref.name).empty?
       @posts = Post.all
       @message = "投稿はありません"
     else
       @posts = Post.where(prefecture: @pref.name).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

    @post = current_user.posts.build
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

         @search = Post.search(params[:q])
         @tennis = @search.result.paginate(page: params[:page])
  end

  # POST /prefs
  # POST /prefs.json
  def create
    @pref = Pref.new(pref_params)
      if @pref.save
      render "prefs/new"
    end



  # PATCH/PUT /prefs/1
  # PATCH/PUT /prefs/1.json
  def update
    respond_to do |format|
      if @pref.update(pref_params)
        format.html { redirect_to @pref, notice: 'Pref was successfully updated.' }
        format.json { render :show, status: :ok, location: @pref }
      else
        format.html { render :edit }
        format.json { render json: @pref.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefs/1
  # DELETE /prefs/1.json
  def destroy
    @pref.destroy
    respond_to do |format|
      format.html { redirect_to prefs_url, notice: 'Pref was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pref
      @pref = Pref.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pref_params
      params.require(:pref).permit(:name)
    end
  end
end
