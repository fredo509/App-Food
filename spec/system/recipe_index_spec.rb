require 'rails_helper'

RSpec.describe 'Recipes index page', type: :system do
  let(:user_attributes) { { name: 'user B', email: 'test@gmail.com', password: '12345' } }
  let(:user) { User.create(user_attributes) }

  before do
    driven_by(:rack_test)
    user.confirm
    sign_in user
  end

  it 'displays the list of user\'s recipes' do
    recipe1 = Recipe.create(user_id: user.id, name: 'Recipe 1', description: 'Description of Recipe 1',
                            preparation_time: 10, cooking_time: 20)
    recipe2 = Recipe.create(user_id: user.id, name: 'Recipe 2', description: 'Description of Recipe 2',
                            preparation_time: 10, cooking_time: 20)

    visit recipes_path

    expect(page).to have_link(recipe1.name, href: user_recipe_path(user, recipe1))
    expect(page).to have_link(recipe2.name, href: user_recipe_path(user, recipe2))
    expect(page).to have_content(recipe1.description)
    expect(page).to have_content(recipe2.description)
  end

  it 'adds links to user\'s recipes' do
    visit recipes_path

    # Assuming recipes are already created for the user
    recipes = user.recipes

    recipes.each do |recipe|
      expect(page).to have_link(recipe.name, href: user_recipe_path(user, recipe))
    end
  end
end
