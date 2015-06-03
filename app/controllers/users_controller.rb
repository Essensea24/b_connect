class UsersController < ApplicationController
  before_action :set_user, only: [:user_page, :my_blogs, :user_blogs, :show, :edit, :update, :destroy]

  def user_page
  end

  def my_blogs
  end 

  def user_blogs
  end

  def index
    @users = User.all
  end

  def show
    
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to user_path(@user), notice: 'Your account is now created'
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private 
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :about_me, :blog_page, :profile_pic)
    end
end
