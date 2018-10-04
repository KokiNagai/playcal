class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :inbox, :outbox]
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

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
  end
end

  def update
    @user = User.find_by(id: params[:id])
   if @user.update_attributes(user_params)
     @user.save
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
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
