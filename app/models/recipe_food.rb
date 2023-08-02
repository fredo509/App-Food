class RecipeFood < ApplicationRecord
  belongs_to :recipes
  belongs_to :food
end
