class SearchController < ApplicationController
  def search
    @articles = params[:q].nil? ? [] : Article.search(params[:q])
  end
end
