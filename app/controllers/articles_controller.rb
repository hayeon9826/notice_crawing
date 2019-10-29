class ArticlesController < ApplicationController

  def index
    # byebug
    @article = Article.all
    if params[:site] == "snu"
      @article = Article.snu
      # byebug
      @article = Article.all.order(created_at: :asc)
      respond_to do |format|
        format.js
      end
    end
    @article = @article.page(params[:page]).per(10)
  end

  def new
  end

  def show
  end

  def crawling
    if params[:site] == "snu"
      @article = Article.snu
    end
    @article = Article.all
    redirect_to articles_path
  end

end
