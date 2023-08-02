class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :manage, :all if user.role == 'admin'
    return unless user.role == 'user'

    can :destroy, Recipe, id: user.id
    can :destroy, Food
    can :create, Recipe, id: user.id
    can :create, Food

    can :new, Inventory, user_id: user.id
    can :create, Inventory, user_id: user.id
    can :destroy, Inventory, user_id: user.id

    can :new, FoodInventory
    can :create, FoodInventory
    can :destroy, FoodInventory
  end
end
