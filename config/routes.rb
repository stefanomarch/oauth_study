# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#welcome'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callback' }
end
