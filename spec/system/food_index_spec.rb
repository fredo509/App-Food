# spec/system/foods_index_spec.rb

require 'rails_helper'

RSpec.describe 'Foods Index', type: :system do
  before(:each) do
    driven_by(:rack_test)
  end

  it 'displays correct elements' do
    Food.create(name: 'Food 1', measurement_unit: 'Unit', price: 10)
    Food.create(name: 'Food 2', measurement_unit: 'Kg', price: 20)

    user = User.create(email: 'test@example.com', password: 'password', confirmed_at: Time.now)
    sign_in user

    visit foods_path

    expect(page).to have_css('.foods-index-cont')
    expect(page).to have_content('to an account to add more food!')
    expect(page).to have_css('.foods-title', text: 'Food')
    expect(page).to have_css('.foods-title', text: 'Measurement Unit')
    expect(page).to have_css('.foods-title', text: 'Unit Price')
    expect(page).to have_css('.foods-name', text: 'Food 1')
    expect(page).to have_css('.foods-measurement', text: 'Unit')
    expect(page).to have_css('.foods-price', text: '10$')
  end
end
