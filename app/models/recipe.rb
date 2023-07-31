class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipe_food
    has_many :foods, through: :recipe_food

    def is_public?
        self.public
    end

end
