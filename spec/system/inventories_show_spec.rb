require 'rails_helper'

RSpec.describe 'Inventory details page', type: :system do
  let(:user_attributes) { { name: 'user B', email: 'test@gmail.com', password: '12345' } }
  let(:user) { User.create(user_attributes) }
  let(:food) { Food.create(name: 'Food 1') }
  let(:inventory) { Inventory.create(user_id: user.id, name: 'inventory 1', description: 'Vel turpis nunc') }

  before do
    driven_by(:rack_test)
    user.confirm
    sign_in user

    FoodInventory.create(inventory_id: inventory.id, food_id: food.id, quantity: 10)
  end

  it 'displays inventory details' do
    visit user_inventory_path(user, inventory)

    expect(page).to have_content('details of inventory')
  end

  it 'displays name' do
    visit user_inventory_path(user, inventory)
    expect(page).to have_content('inventory 1')
  end
end
