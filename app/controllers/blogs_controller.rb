class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]


    def index
      @blogs = Blog.all
    end

    def show 
      @user =  User.find(session[:user_id])
    end

    def new
      @user = session[:user_id]
    end

    def create
      @user =  User.find(session[:user_id])
      @blog = @user.blogs.create(blog_params)
      if @blog.save
        redirect_to user_path(@user.id)
      else 
        render :new
      end
    end

  

    # def edit
    #   @user = session[:user_id]
    # end

    # def update
    # # @user = User.find(params[:user_id])
    #   if @blog.update_attributes(blog_params)
    #     redirect_to blogs_path
    #   else
    #     render :edit
    #   end

    # end

    # def destroy
    # # @user = User.find(params[:user_id])
    #   @blog.destroy
    #   redirect_to blogs_path
    # end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_blog
      @blog = Blog.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def blog_params
      params.require(:blog).permit(:title, :country, :description)
      end

   

end
