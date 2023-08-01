# frozen_string_literal: true

Rails.application.routes.draw do
  # config/routes.rb
  devise_for :users


  root to: 'foods#index'

  resources :users do
    resources :recipes
    resources :inventories, only: %i[index show]
  end

  resources :foods, only: %i[index show new create edit update destroy]
end
