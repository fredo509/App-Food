class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food, foreign_key: 'food_id'
end
