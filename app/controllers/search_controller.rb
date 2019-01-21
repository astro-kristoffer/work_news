class SearchController < ApplicationController
  def search
    if params[:q].present?
      @articles = Article.search(params[:q])
    else
      @articles = nil
    end
  end
end
