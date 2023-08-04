class Inventory < ApplicationRecord
  belongs_to :user
  has_many :food_inventories
  has_many :food, through: :food_inventories

  validates :name, presence: true
  validates :description, presence: true
end
