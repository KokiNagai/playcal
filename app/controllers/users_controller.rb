class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :inbox, :outbox, :show]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @post = current_user.posts.build

    @posts = @user.posts.order(created_at: :desc).paginate(page: params[:page])
  end


  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(name: params[:name])
  end


  private
    def set_user
      @user = User.find_by(name: params[:name])
    end

    def user_params
      params.require(:user).permit(:picture, :name, :email, :birth_date, :live, :introduction, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find_by(name: params[:name])
      if current_user != @user
        redirect_to root_path
      end
    end
end
