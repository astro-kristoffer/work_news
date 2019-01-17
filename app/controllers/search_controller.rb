class SearchController < ApplicationController
  def search
    if params[:q].present?
      @article = []
    else
      @article = Article.search params[:q]
    end
  end
end
