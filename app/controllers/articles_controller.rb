class ArticlesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.search(params[:q]).records.records if params.key?(:q)
    @articles ||= Article.order(_id: -1 )
    @articles = @articles.paginate(page: params[:page], per_page: 2)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
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
    @images = @article.images.all
    respond_to do |format|
      format.js
    end
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        (params[:images].nil? ? [] : params[:images]['file'])
          .each { |file| @article.images.create!(:file => file) }  
        format.html { redirect_to root_path }
        format.js 
      else
        format.js { render :new }
      end
    end
  end

  def update
    (params[:images].nil? ? [] : params[:images]['file'])
      .each { |file| @article.images.create!(:file => file) }
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to root_path }
        format.js
      else 
        format.js {render :edit }
      end
    end
  end
  
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

private
  def find_article
    @article = Article.find(params[:id])
    if @article.nil?
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404"}
        format.js {render 'errors'}
      end
    end
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end