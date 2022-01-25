class ApplicationController < ActionController::Base
  # skip_before_action :authenticate_user!, only: :home

  def home
  end

  # include Pundit

  # # Pundit: white-list approach.
  # after_action :verify_authorized, except: :home, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :home, unless: :skip_pundit?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
    redirect_to(root_path)
  end
end
