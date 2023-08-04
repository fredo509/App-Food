# spec/features/foods_index_spec.rb

require 'rails_helper'

RSpec.feature 'Foods Index', type: :feature do
  scenario 'displays correct elements' do
    food_1 = Food.create(name: 'Food 1', measurement_unit: 'Unit', price: 10)
    food_2 = Food.create(name: 'Food 2', measurement_unit: 'Kg', price: 20)

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
