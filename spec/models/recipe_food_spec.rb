# spec/models/food_inventory_spec.rb
require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'user B', email: 'test@gmail.com', password: '12345') }
  let(:recipe) { Recipe.create(user: user.id, name: 'Kitchen', description: 'Main kitchen inventory', preparation_time: 10, cooking_time: 5) }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'Piece', price: 10) }
  let(:recipe_food) { RecipeFood.new(recipe_id: recipe.id, food_id: food.id, quantity: 20) }

  it 'is not valid without a quantity' do
    recipe_food.quantity = nil
    expect(recipe_food).not_to be_valid
   
  end

  it 'is not valid with a negative quantity' do
    recipe_food.quantity = -5
    expect(recipe_food).not_to be_valid

  end

 
end
