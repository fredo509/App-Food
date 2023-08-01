class Ability
  include CanCan::Ability

  def initialize(user)
    user = User.new 
    can :read, :all

    if User.role == 'admin'
      can :manage, :all
    end
    
    if User.role == 'defaultUser'

      can :destroy, Recipe, user_id: user.id
      can :destroy, Food, user_id: user.id
      can :create, Recipe
      can :create, Food, user_id: user.id
    end 
  end
end