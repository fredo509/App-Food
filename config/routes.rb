# frozen_string_literal: true

Rails.application.routes.draw do
  # config/routes.rb
  devise_for :users


  root to: 'foods#index'

  resources :users 
  resources :users 
  resources :recipes, only: %i[index show destroy]
  resources :inventories
  resources :foods, only: %i[index show new create edit update destroy]
end
