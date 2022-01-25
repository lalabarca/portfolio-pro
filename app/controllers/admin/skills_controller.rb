module Admin
  class SkillsController < AdminController
    before_action :set_skill, only: [:edit, :update, :destroy]

    def new
      @project = ProjectSkill.find(params[:project_id])
      @skill = Skill.new
    end

    def create
    @skill = Skill.new(skill_params)
    @project = ProjectSkill.find(params[:project_id])
    @skill.project = @project
    if @skill.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

    def skill_params
      params.require(:skill).permit(:title, :rating)
    end

    def set_skill
      @skill = Skill.find(params[:id])
    end
  end
end
