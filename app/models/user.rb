# frozen_string_literal: true

# User model
class User < ApplicationRecord
  OAUTH2_PROVIDERS = %i[facebook github google_oauth2 linkedin microsoft_office365].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: OAUTH2_PROVIDERS

  # method to find the user by provider_data , if not found it retrieve email from provider_data and feed devise with a friendly password because
  # devise needs the password
  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
