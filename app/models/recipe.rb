class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food
  has_many :foods, through: :recipe_food

  validates :name, presence: true

  def public?
    public
  end
end
