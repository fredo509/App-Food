class Food < ApplicationRecord
  has_many :recipe_food
  has_many :recipes, through: :recipe_food
  has_many :inventory_food
  has_many :inventories, through: :inventory_food

  validates :price, numericality: { only_integer: true}
end
