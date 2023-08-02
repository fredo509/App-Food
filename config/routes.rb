# frozen_string_literal: true

Rails.application.routes.draw do
  # config/routes.rb
  devise_for :users

    get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

  root to: 'foods#index'

  resources :users  do
  resources :recipes, only: %i[index show new create edit update destroy]
  resources :inventories
end
resources :foods, only: %i[index show new create edit update destroy]
  resources :recipes, only: %i[index show new create edit update destroy]

end
