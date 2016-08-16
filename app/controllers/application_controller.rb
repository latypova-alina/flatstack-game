class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def authenticate_active_admin_user!
    authenticate_user!

    unless current_user.administrator?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
end
