class HomeController < ApplicationController
  def index
    @posts = Post.all
    @articles = Article.all
  end

  def new
    @notice = Notice.all
  end
end
