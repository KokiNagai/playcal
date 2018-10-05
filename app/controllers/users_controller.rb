class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :inbox, :outbox, :show]
  before_action :correct_user, only: [:outbox, :inbox, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @post = current_user.posts.build
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).paginate(page: params[:page])
  end

  def outbox
    @post = current_user.posts.build
    @comment_recieved = current_user.to_comments
    @comments = current_user.comments
  end

  def inbox
    @post = current_user.posts.build
    @comment_recieved = current_user.to_comments
    @posts = current_user.posts
  end

  


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:picture, :name, :email, :birth_date, :live, :introduction, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to root_path
      end
    end
end
