# spec/models/food_inventory_spec.rb
require 'rails_helper'

RSpec.describe FoodInventory, type: :model do
  let(:user) { User.create(name: 'user B', email: 'test@gmail.com', password: '12345') }
  let(:inventory) { Inventory.create(user: user.id, name: 'Kitchen', description: 'Main kitchen inventory') }
  let(:food) { Food.create(name: 'Apple', measurement_unit: 'Piece', price: 10) }
  let(:food_inventory) { FoodInventory.new(inventory_id: inventory.id, food_id: food.id, quantity: 20) }

  it 'is not valid without a quantity' do
    food_inventory.quantity = nil
    expect(food_inventory).not_to be_valid
  end

  it 'is not valid with a negative quantity' do
    food_inventory.quantity = -5
    expect(food_inventory).not_to be_valid
  end
end
