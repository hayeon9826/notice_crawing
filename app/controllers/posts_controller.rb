class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create!(post_params)
    if @post.save
      redirect_to home_index_path notice: "게시물이 생성되었습니다"
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @post = Post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit!
  end

end
