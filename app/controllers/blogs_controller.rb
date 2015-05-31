class BlogsController < ApplicationController
  # before_action :set_blog, only: [:show, :edit, :update, :destroy]


    def index
      @user =  User.find(session[:user_id])
      @blogs = Blog.all
    end

    def show 
      @user =  User.find(session[:user_id])
      @blog = Blog.find(params[:id])
    end

    def new
      @user = User.find(session[:user_id])
    end

    def create
      @user = User.find(session[:user_id])
      @blog = @user.blogs.new(blog_params)

      if @blog.save
        redirect_to user_path(@user.id)
      else 
        render :new
      end
    end

  

    def edit
      @user = User.find(session[:user_id])
      @blog = @user.blogs.find(params[:id])
    end

    def update
      @user = User.find(session[:user_id])
      @blog = @user.blogs.find(params[:id])
      if @blog.update
        redirect_to user_path(@user.id)
      else
        render :edit
      end

    end

    def destroy
      @user =  User.find(session[:user_id])
      @blog = @user.blogs.find(params[:id])
      @blog.destroy
      redirect_to user_path(@user.id)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_blog
      # @blog = Blog.find(params[:id])
      # end

      # Never trust parameters from the scary internet, only allow the white list through.
      def blog_params
      params.require(:blog).permit(:photo, :title, :country, :description)
      end

   

end
