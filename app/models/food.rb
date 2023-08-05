# app/models/food.rb
class Food < ApplicationRecord
  has_many :food_inventories
  has_many :inventories, through: :food_inventories

  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods

  validates :price, numericality: { only_integer: true }
  validates :name, presence: true
  validates :measurement_unit, presence: true
end
