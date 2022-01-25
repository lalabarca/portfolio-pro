class ProjectsController < ApplicationController
  # skip_after_action :verify_authorized, only: :show
  def show
    @project = Project.find(params[:id])
    @skill = Skill.new
  end
end
