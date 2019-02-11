class ArticlesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search] 

  def search
    if params[:q].present?
      @articles = Article.search(params[:q]).records.records.paginate(page: params[:page], per_page: 2)
    else
      @articles = []
    end
    respond_to do |format|
      format.js
    end
  end

  def index
    @articles = Article.order(_id: -1 ).paginate(page: params[:page], per_page: 2)
    respond_to do |format|
      format.html
      format.js
    end
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
    @images = @article.images.all
    respond_to do |format|
      format.js
    end
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        if params[:images] != nil
          params[:images]['file'].each do |file|
            @image = @article.images.create!(:file => file)
          end
        end
        @articles = Article.order(_id: -1 ).paginate(page: params[:page], per_page: 2)
        format.html { redirect_to root_path }
        format.js 
      else
        format.js { render :new }
      end
    end
  end

  def update
    @article = Article.find(params[:id])
    if params[:images] != nil
      params[:images]['file'].each do |file|
        @image = @article.images.create!(:file => file)
      end
    end
    respond_to do |format|
      if @article.update(article_params)
        @articles = Article.order(_id: -1 ).paginate(page: params[:page], per_page: 2)
        format.html { redirect_to root_path }
        format.js
      else 
        format.js {render :edit }
      end
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    @articles = Article.order(_id: -1 ).paginate(page: params[:page], per_page: 2) 
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private  
    def article_params
      params.require(:article).permit(:title, :text)
    end
end