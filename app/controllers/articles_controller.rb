class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.where("id = #{params[:id]}").first
  end
end
