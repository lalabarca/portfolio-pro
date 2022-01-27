module Admin
  class SkillsController < AdminController
    before_action :set_skill, only: %i[edit update destroy]

    def index
      @skills = Skill.includes(:projects).all.order(:id)
    end

    def new
      @skill = Skill.new
    end

    def create
      @skill = Skill.new(skill_params)

      if @skill.save
        flash.notice = "Compétence ajoutée"
        redirect_to admin_skills_path
      else
        flash.alert = "Une erreur est survenue"
        render :new
      end
    end

    def edit
    end

    def update
      if @skill.update(skill_params)
        flash.notice = "Modifications enregistrées"
        redirect_to admin_path
      else
        flash.alert = "Une erreur est survenue"
        render :edit
      end
    end

    def destroy
      @skill.destroy
      redirect_to admin_projects_path
    end

    private

    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:title, :rating, :photo)
    end
  end
end
