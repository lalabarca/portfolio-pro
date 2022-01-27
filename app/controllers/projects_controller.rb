class ProjectsController < ApplicationController
  # skip_after_action :verify_authorized, only: :show
  def show
    @project = Project.find(params[:id])
  end

  def date_format(date)
    date.strftime("%A %B %Y")
  end
  helper_method :date_format
end
