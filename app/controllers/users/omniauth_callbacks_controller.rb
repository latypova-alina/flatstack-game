class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :enter_with_oauth

  def facebook
  end

  def vkontakte
  end

  def google_oauth2
  end

  def enter_with_oauth
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: action_name) if is_navigational_format?
    else
      session["devise.oauth_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def failure
    redirect_to root_path
  end



end