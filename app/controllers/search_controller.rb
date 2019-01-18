class SearchController < ApplicationController
  def search
    if params[:q].present?
      @article = Article.search(params[:q])
    else
      @article = nil
    end
  end
end
