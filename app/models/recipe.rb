class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipe_food
  has_many :food, foreign_key: 'id'
  validates :name, presence: true

  def public?
    public
  end
end
