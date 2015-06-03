class BlogsController < ApplicationController
  before_action :authorized?,  only: [:new, :create, :show]

    def index
      @user = get_user
      @blogs = @user.blogs
    end

    def show 
      @blog = get_blog
    end

    def new
      @blog = get_user.blogs.build
    end

    def create
       
        @blog = get_user.blogs.create(blog_params)
         
            if @blog.save
              redirect_to user_path(get_user)
            else 
              render :new
            end
 
    end

    def edit
      @blog = get_blog
      unless @blog.user.id == current_user.id 
        redirect_to user_path(current_user)
      end
    end

    def update
      @blog = get_blog
      if @blog.user_id == current_user.id
        get_blog.update_attributes(blog_params)
        redirect_to user_path(get_user)
      end
     
    end


    def destroy
        @blog = get_blog
        if @blog.user_id == current_user.id
          get_blog.destroy
          redirect_to user_path(get_user)
        else 
          redirect_to user_path(current_user)
        end
      
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

      def get_user
        User.find(params[:user_id])
      end

      def get_blog
        Blog.find(params[:id])
      end

   

end
