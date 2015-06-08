
class LikesController < ApplicationController

  def create  
      
      @like = Like.create(:user_id => current_user.id, :blog_id => params[:blog_id])
  	
  		redirect_to users_path, notice: "you successfully liked this blog"

  end

  def destroy
  end

  private 

  	 def get_blog
     		 Blog.find(params[:blog_id])
    	end

    	def get_like
    		Like.find(params[:id])
    	end
end


