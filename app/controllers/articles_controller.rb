class ArticlesController < ApplicationController
  include Paginable
  before_action :set_article, only: %i[edit update destroy]
  before_action :set_categories, only: %i[new edit update create]
  before_action :authenticate_user!, except: %i[index show]
  def index
    category = @categories.select{ |c| c.name == params[:category]}[0] if params[:category].present?

    @highlights = Article.includes(:category)
                          .filter_by_category(category)
                          .filter_by_archive(params[:month_year])
                          .desc_order
                          .first(3)
    highlights_ids = @highlights.pluck(:id).join(',')

    @articles = Article.includes(:category)
                      .without_highlights(highlights_ids)
                      .filter_by_category(category)
                      .filter_by_archive(params[:month_year])
                      .desc_order
                      .page(current_page)
    @archives = Article.group_by_month(:created_at, format: '%B %Y', locale: :en).count

  end

  def show
    article = Article..includes(comments: :user).find(params[:id])
    authorize @article
  end

  def new
    @article = current_user.articles.new
    @categories = Category.sorted
  end

  def edit
  end

  def create
    @article  = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else 
      render :new
    end
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article
    else 
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  private
  def set_categories
    @categories = Category.sorted
  end

  def set_article
    @article = Article.find(params[:id])
    authorize @article
  end
  def article_params
    params.require(:article).permit(:title,:body, :category_id)
  end
end
