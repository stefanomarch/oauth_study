# frozen_string_literal: true

# Create user from the provider data
class OmniauthController < ApplicationController
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you by google. Please register or try signin in later'
      redirect_to new_user_registration_path
    end
  end

  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you through Facebook. Please register or try signin in later'
      redirect_to new_user_registration_path
    end
  end

  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem signing you by Github. Please register or try signin in later'
      redirect_to new_user_registration_path
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in .Please register or try signin in later'
    redirect_to new_user_registration_path
  end
end
