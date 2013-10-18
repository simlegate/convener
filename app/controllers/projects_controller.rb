class ProjectsController < ApplicationController

  def index
    @projects = Project.find_with_current_user current_user
  end

  def create
    project = Project.create_with_current_user project_params, current_user
    redirect_to project_path project
  end

  def show
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
