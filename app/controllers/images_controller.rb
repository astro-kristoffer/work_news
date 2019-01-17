class ImagesController < ApplicationController

  before_action :authenticate_admin!

  def create

    @article = Article.find(params[:article_id])

    @image = @article.images.create(images_params)

    puts "\n\n\n\n!!!!!!!!!!!!\n\n\n\n"
    p @image
    p @image.errors
    puts "\n\n\n\n!!!!!!!!!!!!\n\n\n\n"
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
