# frozen_string_literal: true

# Create user from the provider data
class OmniauthCallbackController < ApplicationController
  def google_oauth2
    manage_user_with_omniauth(:google_oauth2)
  end

  def facebook
    manage_user_with_omniauth(:facebook)
  end

  def github
    manage_user_with_omniauth(:github)
  end

  def linkedin
    manage_user_with_omniauth(:linkedin)
  end

  def microsoft_office365
    manage_user_with_omniauth(:microsoft_office365)
  end

  def failure
    flash[:error] = 'There was a problem signing you in .Please register or try signin in later'
    redirect_to new_user_registration_path
  end

  private

  def manage_user_with_omniauth(provider)
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = "There was a problem signing you in with #{provider.to_s.capitalize} .Please register or try signin in later"
      redirect_to new_user_registration_path
    end
  end
end
