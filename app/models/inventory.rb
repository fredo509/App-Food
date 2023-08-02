class Inventory < ApplicationRecord
  belongs_to :user

  has_many :food_inventories
  has_many :food, through: :food_inventories
end
