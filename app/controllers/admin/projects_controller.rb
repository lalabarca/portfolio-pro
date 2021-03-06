module Admin
  class ProjectsController < AdminController
    require 'action_view'
    include ActionView::Helpers::DateHelper

    before_action :set_project, only: [:edit, :update, :destroy]

    def index
      @projects = Project.order(created_at: :desc)
    end

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)
      if @project.save
        flash.notice = "Projet ajouté"
        redirect_to root_path(anchor: "projects")
      else
        flash.alert = "Une erreur est survenue"
        render :new
      end
    end

    def edit
    end

    def update
      @project.update(project_params)
      redirect_to project_path(@project)
    end

    def destroy
      @project.destroy
      redirect_to admin_path
    end

    def time_ago(date)
      from_time = Time.now
      distance_of_time_in_words(from_time, date)
    end
    helper_method :time_ago

    private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :finished, :date_start, :date_end, :url, :collaborator_desc, photos: [], skill_ids: [])
    end
  end
end
