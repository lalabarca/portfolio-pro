class ProjectsController < ApplicationController
  # skip_after_action :verify_authorized, only: :show
  def show
    @project = Project.find(params[:id])
    @nb_jours = (@project.date_end - @project.date_start).to_i
  end

  def date_format(date)
    date.strftime("%-d/%-m/%Y")
  end

  helper_method :date_format
end
