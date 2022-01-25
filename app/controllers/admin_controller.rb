class AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin!

  def index
    @projects = Project.order(created_at: :desc)
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to :home unless current_user.admin
  end
end
