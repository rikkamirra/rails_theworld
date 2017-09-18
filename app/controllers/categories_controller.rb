class CategoriesController < ApplicationController
  before_action :set_project
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :set_parent_category, only: [:new, :create, :show, :update]

  ABSTRACT_PARENT_ROOT = { :id => 0, :title => "" }

  def index
    @root_categories = @project.categories.select { |category| category.parent_id == 0 }
  end

  def show
  end

  def new
  end

  def  create
    @category = Category.new(category_params)
    @category.project = @project
    @category.parent_id = @parent_category[:id]
    @category.save
    redirect_to @project
  end

  def update
  end

  def destroy
    @category.delete_with_children
    redirect_to @project
  end


  private

  def category_params
    params.require(:category).permit(:title)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_parent_category
    if params[:category_id] != '0'
      @parent_category = Category.find(params[:category_id])
    else
      @parent_category = ABSTRACT_PARENT_ROOT
    end
  end
end
