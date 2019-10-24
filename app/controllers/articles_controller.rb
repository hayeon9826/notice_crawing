class ArticlesController < ApplicationController
  def index
    @article = Article.all
    if params[:site] == "snu"
      @article = Article.snu
      @article = Article.all
      respond_to do |format|
        format.js
      end
    end
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
