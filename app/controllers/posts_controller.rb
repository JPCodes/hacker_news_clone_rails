class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_path(@post.user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to user_path(@post.user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user)
  end

private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
