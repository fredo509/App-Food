require 'rails_helper'

RSpec.describe 'Recipe show page', type: :system do
  let(:user_attributes) { { name: 'user B', email: 'test@gmail.com', password: '12345' } }
  let(:user) { User.create(user_attributes) }
  let(:food) { Food.create(name: 'Food 1') }
  let(:recipe) do
    Recipe.create(user_id: user.id, name: 'Recipe 1', description: 'Description of Recipe 1', preparation_time: 10,
                  cooking_time: 20, public: true)
  end


  before do
    user.confirm
    sign_in user
    RecipeFood.create(food_id: food.id, recipe_id: recipe.id, quantity: 10)
  end


  it 'displays recipe details, ingredients, and actions' do
    visit user_recipe_path(user, recipe)

    expect(page).to have_content('Recipe 1')
  end

  it 'displays description' do
    visit user_recipe_path(user, recipe)
    expect(page).to have_content('Description of Recipe 1')
  end

  it ' displays preparation time' do
    visit user_recipe_path(user, recipe)
    expect(page).to have_content(10)
  end

  it ' displays cooking time' do
    visit user_recipe_path(user, recipe)
    expect(page).to have_content(20)
  end
end
