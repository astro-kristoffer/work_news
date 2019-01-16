class ImagesController < ApplicationController

  before_action :authenticate_admin!

  def new
    @article = Article.new
    @image = @article.images.create(images_params)
    if @image.save
      redirect_to article_path(@article)
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @image = @article.images.create(images_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @image = @article.images.find(params[:id])
    @image.destroy
    redirect_to article_path(@article)
  end

  private  
    def images_params
      params.require(:image).permit(:file)
    end
end
