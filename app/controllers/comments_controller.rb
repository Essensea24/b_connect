class CommentsController < ApplicationController
 
  def new
    @user_comment = get_user.comments.build
    @blog_comment = get_blog.comments.build
  end

  def create
    @user_comment = get_user.comments.create(comment_params)
    @blog_comment = get_blog.comments.create(comment_params)

    if @user_comment.save & @blog_comment.save
      redirect to blog_path(@blog.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
    def comment_params
      params.require(:comment).permit(:username, :body)
    end

    def get_user
      User.find(params[:user_id])
    end

    def get_blog
      Blog.find(params[:blog_id])
    end

    def get_comment
      Comment.find(params[:id])
    end

end
