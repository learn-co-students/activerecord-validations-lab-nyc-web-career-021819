class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render 'show'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :summary, :category)
  end
end
