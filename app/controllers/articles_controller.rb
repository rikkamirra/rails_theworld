class ArticlesController < ApplicationController
  before_action :set_project_and_category
  before_action :set_article, only: [:show, :edit, :destroy]

  def index
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.project = @project
    @article.save!

    @article.categories << @category

    redirect_to @project
  end

  def edit
  end

  def update
    @article.update(article_params)
  end

  def destroy
    @article.delete
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_project_and_category
    @project = Project.find(params[:project_id])
    @category = Category.find(params[:category_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
