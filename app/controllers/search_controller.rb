class SearchController < ApplicationController
  # отдельный контроллер не должен требоваться
  def search
    if params[:q].present?
      @articles = Article.search(params[:q]).records.records
    else
      @articles = nil
    end
  end
end
