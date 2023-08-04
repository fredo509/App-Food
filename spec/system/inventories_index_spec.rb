require 'rails_helper'

RSpec.describe 'Inventories index page', type: :system do
  let(:user_attributes) { { name: 'user B', email: 'test@gmail.com', password: '12345' } }
  let(:user) { User.create(user_attributes) }

  before(:each) do
    user.confirm
    sign_in user

    # Create and save inventories before each test case
    Inventory.create(user_id: user.id, name: 'inventory 1', description: 'Vel turpis nunc')
    Inventory.create(user_id: user.id, name: 'inventory 2', description: 'Another inventory')
  end

  it 'displays inventory h1' do
    visit user_inventories_path(user_id: user.id)
    expect(page).to have_content('Inventory')
  end


  it 'displays names ' do
    visit user_inventories_path(user_id: user.id)
    expect(page).to have_content('inventory 1')
    expect(page).to have_content('inventory 2')
  end

  it 'displays descriptions' do
    visit user_inventories_path(user_id: user.id)
    expect(page).to have_content('Vel turpis nunc')
    expect(page).to have_content('Another inventory')
  end

  it 'displays links to view inventory details' do
    visit user_inventories_path(user_id: user.id)
    expect(page).to have_link('inventory 1', href: user_inventory_path(user, Inventory.find_by(name: 'inventory 1')))
    expect(page).to have_link('inventory 2', href: user_inventory_path(user, Inventory.find_by(name: 'inventory 2')))
  end

  it 'displays the "Add Inventory" link' do
    visit user_inventories_path(user_id: user.id)
    expect(page).to have_link('Add Inventory', href: new_user_inventory_path(user))
  end
end
