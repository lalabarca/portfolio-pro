class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    @projects = Project.includes(:skills).order(:updated_at)
    @skills = Skill.includes(:projects).order(:created_at)
    @finished_projects = Project.where(finished: true).count
    @expert_skills = Skill.where(rating: 3).count
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to :home unless current_user.admin
  end
end
