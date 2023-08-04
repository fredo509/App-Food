# spec/system/recipe_index_spec.rb

require 'rails_helper'

RSpec.describe 'Recipes Index View', type: :system do
  it 'displays the correct elements when there are recipes' do
    let(:user_attributes) { { name: 'user B', email: 'test@gmail.com', password: '12345' } }
    let(:user) { User.create(user_attributes) }
   

  
    recipe_1 = Recipe.create(name: 'Recipe 1', description: 'Description 1', user: user.id)
    recipe_2 = Recipe.create(name: 'Recipe 2', description: 'Description 2', user: user.id, preparation_time: 10, cooking_time: 20, public: true)

    
    visit recipes_path

    expect(page).to have_selector('.recipes-index-list', count: 2)

   
    expect(page).to have_link('Recipe 1', href: user_recipe_path(user, recipe_1))
    expect(page).to have_link('Recipe 2', href: user_recipe_path(user, recipe_2))
    expect(page).to have_content('Description 1')
    expect(page).to have_content('Description 2')
  end
end
