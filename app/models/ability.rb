class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :manage, Recipe, public: true
    cannot :destroy, Recipe

    can :manage, :all if user.role == 'admin'

    return unless user.role == 'user'

    can :manage, Food
    can :manage, Recipe, user_id: user.id
    can :manage, RecipeFood, recipe: { user_id: user.id }
    can :create, Recipe
    can :create, RecipeFood
    
    can :manage, Inventory, user_id: user.id
    can :create, Inventory
    can :manage, FoodInventory, inventory: { user_id: user.id }
    can :create, FoodInventory
    
  end
end
