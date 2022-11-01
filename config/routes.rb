# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'application#welcome'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
