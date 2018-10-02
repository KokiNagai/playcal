class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :show, :posting]
    before_action :correct_user, only: :destroy

    def show
        @post = Post.includes(:user).find(params[:id])
        @user = @post.user
        @post_count = @post.comments.where(user_id: current_user.id)
        @room = @user.rooms.build(user_id: @user.id, post_id: @post.id)
    end


    def create
    @post = current_user.posts.build(posts_params)
    @place = @post.prefecture
    @pref = Pref.find_by(name: @place)
    if @post.save
        @posts = Post.where(prefecture: @post.prefecture).paginate(page: params[:page], per_page: 10)
        redirect_to("/find")
      else
       render 'posting'
    end
 end

   def destroy
      @post.destroy
      redirect_to request.referrer || root_path
  end

  def posting
       if logged_in?
    @post = current_user.posts.build
    @user = User.find_by(params[:id])
    @feed_index = @user.feed.paginate(page: params[:page])
  end
  end

  def count_user
    @count_user2 = @post.user
    return @count_user2
  end

 private

    def posts_params
        params.require(:post).permit(:content, :prefecture, :city, :title, :member, :skill, :gender, :playday, :style)
    end

    def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_path if @post.nil?
    end


end
