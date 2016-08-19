module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :enter_with_oauth

    def facebook
    end

    def vkontakte
    end

    def google_oauth2
    end

    def valid_user
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: action_name) if is_navigational_format?
    end

    def not_valid_user
      session["devise.oauth_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end

    def enter_with_oauth
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        valid_user
      else
        not_valid_user
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
