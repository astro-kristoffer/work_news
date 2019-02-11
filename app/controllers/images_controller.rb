class ImagesController < ApplicationController

  before_action :authenticate_admin!

  def create
    @article = Article.find(params[:article_id])
    @image = @article.images.create(images_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @image = @article.images.find(params[:id])
    @image.destroy
    respond_to do |format|
      format.js
    end
  end

  private  
    def images_params
      params.require(:image).permit(:file)
    end
end
