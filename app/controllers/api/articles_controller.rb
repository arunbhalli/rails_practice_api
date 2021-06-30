class Api::ArticlesController < ApplicationController
  def index
    article = Article.all
    render json: { articles: article }
  end
  def show
    article=Article.find(params[:id]) 
    render json: { article: article}
  end
end
