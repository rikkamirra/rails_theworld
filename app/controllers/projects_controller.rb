class ProjectsController < ApplicationController
  before_action :authenticate_user!, :except => [:show]

  def index
    @projects = Project.all
  end

  def new
  end

  def edit
  end

  def show
    @project = Project.find(params[:id])
    @root_categories = @project.categories.select { |category| category.parent_id == 0 }
    puts @root_categories
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    redirect_to @project
  end

  def destroy
  end

  def update
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
