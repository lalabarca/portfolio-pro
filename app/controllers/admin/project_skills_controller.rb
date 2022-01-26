module Admin
  class ProjectSkillsController < AdminController

    before_action :set_project, only: [:new, :create, :edit, :update, :destroy]

    def index
      @project_skills = ProjectSkill.order(created_at: :desc)
    end

    def new
      @project = Project.find(params[:project_id])
      @project_skill = ProjectSkill.new
    end

    def create
      @project = Project.find(params[:project_id])

      params[:project_skill][:skill].each do |skill_id|
      unless skill_id == ""
        @skill = Skill.find(skill_id)
        @project_skill = ProjectSkill.new
        @project_skill.project = @project
        @project_skill.skill = @skill
        @project_skill.save
      end

      redirect_to project_path(@project)
    end

    def update
      @project_skill.update(project_params)
      redirect_to project_path(@project)
    end

    def destroy
      @project.destroy
      redirect_to projects_path
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

    def project_skill_params
      params.require(:project).permit(:title, :description, :finished, :date_start, :date_end, :url, :collaborators_desc, photos: [])
    end
  end
end
