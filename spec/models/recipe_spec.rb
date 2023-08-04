require 'rails_helper'
    
    RSpec.describe Recipe, type: :model do
    let(:recipe) { Recipe.new }
    
    it 'is not valid without a name' do
        recipe.name = nil
        expect(recipe).not_to be_valid
       
    end
    
    it 'is not valid without a description' do
        recipe.description = nil
        expect(recipe).not_to be_valid
    
    end

    it 'is not valid without a preparation time' do
        recipe.preparation_time = nil
        expect(recipe).not_to be_valid
    end

    it 'is not valid without a cooking time' do
        recipe.cooking_time = nil
        expect(recipe).not_to be_valid
    end
    
   
    end