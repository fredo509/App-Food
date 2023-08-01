class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, :all
    can :manage, :all if user.role == 'admin'
      return unless user.role == 'user'
      can :destroy, Recipe, user_id: user.id
      can :destroy, Food, user_id: user.id
      can :create, Recipe
      can :create, Food, user_id: user.id 
  end
end