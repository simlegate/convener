class ProjectsController < ApplicationController

  def index
  end

  def create
    Project.create_with_current_user project_params, current_user
  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end
