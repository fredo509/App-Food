# spec/models/inventory_spec.rb
require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) { User.create(name: 'user B', email: 'test@gmail.com', password: '12345') }
  let(:inventory) { Inventory.new(user:) }

  it 'is not valid without a name' do
    expect(inventory).not_to be_valid
    expect(inventory.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without a description' do
    expect(inventory).not_to be_valid
    expect(inventory.errors[:description]).to include("can't be blank")
  end

  it 'is valid with all required attributes' do
    inventory.name = 'Kitchen'
    inventory.description = 'Main kitchen inventory'
    expect(inventory).to be_valid
  end
end
