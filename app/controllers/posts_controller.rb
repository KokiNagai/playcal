class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy, :show, :posting]
    before_action :correct_user, only: [:destroy]


    def show
        @post = Post.includes(:user).find(params[:id])
        @user = @post.user
        @post_count = @post.comments.where(user_id: current_user.id)
        @room = @user.rooms.build(user_id: @user.id, post_id: @post.id)
    end


    def create
    @post = current_user.posts.build(posts_params)
    @place = @post.prefecture
    if @post.save
        @posts = Post.where(prefecture: @post.prefecture).paginate(page: params[:page], per_page: 10)
        redirect_to("/find")
      else
       render 'posting'
    end
 end

   def destroy
      @post = Post.includes(:user).find(params[:id])
      @post.destroy
      redirect_to current_user
  end

  def posting
    @post = current_user.posts.build
    @user = User.find_by(name: params[:name])
  end


  def post_end
    @post = Post.find_by(id: params[:id])
    @post.update term: false
    redirect_to @post
  end



 private

    def posts_params
        params.require(:post).permit(:content, :prefecture, :city, :title, :member, :skill, :gender, :playday, :style)
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
      if current_user != @post.user
        redirect_to root_path
      end
    end



end
