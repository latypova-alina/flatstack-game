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

    redirect_to root_path, alert: "Unauthorized Access!" unless current_user.administrator?
  end
end
