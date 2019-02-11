class ImagesController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @article = Article.find(params[:article_id])
    @image = @article.images.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.js
    end
  end
end
