# frozen_string_literal: true

Rails.application.routes.draw do
  # config/routes.rb
  devise_for :users

  root to: 'recipes#public_recipes'

  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
  
  
  resources :users  do
    resources :recipes, only: %i[index show new create edit update destroy] do
      resources :recipe_food, only: %i[new show create destroy update edit ]
      get 'shopping_list', to: 'recipes#shopping_list', as: 'shopping_list' do
      end
    end
    resources :inventories, only: %i[index show new create edit update destroy] do
    resources :food_inventories, only: %i[index show new create destroy]
  end
end

  resources :foods, only: %i[index show new create edit update destroy]
  resources :recipes, only: %i[index show new create edit update destroy]

end
