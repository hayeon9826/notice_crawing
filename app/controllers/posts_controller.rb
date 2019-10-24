class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.create!(post_params)
    if @post.save
      redirect_to root_path notice: "게시물이 생성되었습니다"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :name)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
