# frozen_string_literal: true

Rails.application.routes.draw do
  # config/routes.rb
  devise_for :users


  root to: 'foods#index'

  resources :users  do
  resources :recipes, only: %i[index show new create edit update destroy]
  resources :inventories
end
resources :foods, only: %i[index show new create edit update destroy]
  resources :recipes, only: %i[index show new create edit update destroy]

end
