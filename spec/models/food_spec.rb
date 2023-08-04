# spec/models/food_spec.rb
require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:food) { Food.new }

  it 'is not valid without a name' do
    expect(food).not_to be_valid
    expect(food.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without a measurement unit' do
    expect(food).not_to be_valid
    expect(food.errors[:measurement_unit]).to include("can't be blank")
  end

  it 'is not valid with a non-integer price' do
    food.price = 10.5
    expect(food).not_to be_valid
    expect(food.errors[:price]).to include("must be an integer")
  end

  it 'is valid with all required attributes' do
    food.name = 'Apple'
    food.measurement_unit = 'Piece'
    food.price = 10
    expect(food).to be_valid
  end
end
