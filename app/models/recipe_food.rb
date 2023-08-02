class RecipeFood < ApplicationRecord
  belongs_to :recipes
  belongs_to :food, foreign_key: 'food_id'
end
