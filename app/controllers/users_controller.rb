class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :inbox, :outbox, :show]
  before_action :correct_user, only: [:edit, :update, :likes]
  before_action :new_user, except: :edit

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

  def likes
    @likes = Like.where(user_id: current_user.id).limit(20).order(created_at: :desc)
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

    def new_user
      if user_signed_in?
      unless current_user.gender.present?
      redirect_to edit_path
      flash[:alert] = "※ プロフィールの編集を完了してください。"
    end
    end
    end

end
