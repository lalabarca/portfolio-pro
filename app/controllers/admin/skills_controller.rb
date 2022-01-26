module Admin
  class SkillsController < AdminController
    before_action :set_skills_from_id, only: %i[edit update destroy]

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

    def edit; end

    def update
      if @skill.update(skill_params)
        flash.notice = "Modifications enregistrées"
        redirect_to edit_admin_skill_path(@skill.id)
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

    def skill_params
      params.require(:skill).permit(:title, :rating)
    end

    def set_skill_from_id
      @skill = Skill.find_by_id(params[:id])
    end

  end
end
