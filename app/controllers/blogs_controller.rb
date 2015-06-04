class BlogsController < ApplicationController
  before_action :authorized?,  only: [:new, :create]

     def my_blogs
    end 

    def index
      @blogs = Blog.all
    end

    def show 
      @blog = get_blog
      # @comment = Comment.find(params[:id])
    end

    def new
      @blog = get_user.blogs.build
    end

    def create
       
        @blog = get_user.blogs.create(blog_params)
         
            if @blog.save
              redirect_to user_all_blogs_path(current_user)
            else 
              render :new
            end
 
    end

    def edit
      @blog = get_blog
      unless @blog.user.id == current_user.id 
        redirect_to user_all_blogs_path(@user.id)
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
          @blog.destroy
          redirect_to user_path(current_user)
        else 
          redirect_to login_path
        end
      
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_blog
      # @blog = Blog.find(params[:id])
      # end

      # Never trust parameters from the scary internet, only allow the white list through.
      def blog_params
        params.require(:blog).permit( :title, :country, :description, :image)
      end

      def get_user
        User.find(params[:user_id])
      end

      def get_blog
        Blog.find(params[:id])
      end

   

end
