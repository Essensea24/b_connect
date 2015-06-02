class BlogsController < ApplicationController
  before_action :authorized?,  only: [:new, :create, :show]

    def index
      blogs = Blog.all
    end

    def show 
      @blog = Blog.find(params[:id])

    end

    def new
      @blog = Blog.new
    end

    def create
      blog = Blog.new(blog_params)
      blog.user_id = session[:user_id]

      if blog.save
        redirect_to user_path(session[:user_id])
      else 
        render :new
      end
    end

  

    def edit
      blog = Blog.find(params[:id])
    end

    def update
      @blog = Blog.find(params[:id])
      @blog.user_id = session[:user_id]
      @blog.update_attributes(blog_params)

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
