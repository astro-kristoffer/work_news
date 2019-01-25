class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!, except: [:index, :show] 

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @images = @article.images.all
  end

  def new
    @article = Article.new
    @image = @article.images.build
    respond_to do |format|
      format.js
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        params[:images]['file'].each do |i|
          @image = @article.images.create!(:file => i)
        end
        format.html { redirect_to @article, notice: 'Cтатья сохранена.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Статья обновлена.' }
        format.json { render :show, status: :ok, location: @article } 
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end

  private  
    def article_params
      params.require(:article).permit(:title, :text, images_attributes: [:id, :file])
    end
end
