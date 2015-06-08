class BlogsController < ApplicationController
  before_action :authorized?,  only: [:new, :create]

      # def like 
      #   @blog = get_blog
      #   @flagged = flag(@blog, :like)
      #   @flagged.save
      #   redirect_to blogs_path, notice: "#{current_user.first_name} liked #{@blog.title}"
      # end 

     def maps
      @blogs = Blog.all
      respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @blogs
        }
      end
    end 

    def index

      if params[:search]
        p = "%" + params[:search] + "%"
        @blogs = Blog.where("country ILIKE ? OR title ILIKE ? OR description ILIKE ?", p, p, p)
      else
        @blogs = Blog.all
      end
      respond_to do |format|
        format.html {
            render
        }
        format.json {
            render json: @blogs
        }
      end 
    end

    def show 
      @blog = get_blog
      # @comment = Comment.find(params[:id])
      respond_to do |format|
        format.html {
            render :show
        }
        format.json {
            render json: @blog
        }
      end
    end

    def new
    @blog = get_user.blogs.build
    end

    def create
       
        @blog = get_user.blogs.create(blog_params)
         
            respond_to do |format|
              if @blog.save
               format.html { redirect_to user_all_blogs_path(current_user)}
               format.json { render :show, status: :created, location: @blog}
              else 
          
               format.html { render :new}
               format.json { render json: @map.errors, status: :unprocessable_entity}
              end
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
          respond_to do |format|
            format.html{ redirect_to user_path(get_user)}
            format.json { render :show, status: :ok, location: @blog }
          end
      end

     
    end


    def destroy
        @blog = get_blog
      
      respond_to do |format|
        if @blog.user_id == current_user.id
          @blog.destroy
          format.html { redirect_to user_path(current_user) }
          format.json { head :no_content }
        else 
          redirect_to login_path
        end
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
