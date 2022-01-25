class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def authenticate_admin!
    authenticate_user!
    redirect_to :home unless current_user.is_admin?
  end
end
