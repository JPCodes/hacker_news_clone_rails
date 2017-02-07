class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    
    @user.comments.build(comment_params).save
    @post.comments.build(comment_params).save

    if true
      redirect_to user_post_path(@user, @post)
    else
      @comment = Comment.new
      render :edit
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
