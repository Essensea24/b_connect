class CommentsController < ApplicationController

  def index
    @blog = get_blog
    @comments = Comment.all
  end 

 
  def new
    @blog = get_blog
    @comment = get_comment
    @user = current_user

  end

  def create
    @blog = get_blog
    @user = current_user
    @user_comment = @user.comments.create(comment_params) 
    @user_comment.blog_id = @blog.id

    @user_comment.username = current_user.username

    if @user_comment.save
      redirect_to blog_path(@blog.id)
    else
      render :new
    end
  end

  def edit

    @comment = get_comment
    unless @comment.user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @comment = get_comment
    if @comment.user_id == current_user.id
        get_comment.update_attributes(comment_params)
        redirect_to user_path(get_user)
    end

  end

  def destroy
    @comment = get_comment
    if @comment.user_id == current_user.id
      get_comment.destroy
      redirect_to user_path(get_user)
    else 
      redirect_to login_path
    end
  end

  private 
    def comment_params
      params.require(:comment).permit(:username, :body, :comment_id)
    end


    def get_blog
      Blog.find(params[:blog_id])
    end

    def get_comment
      Comment.find(params[:id])
    end

end
