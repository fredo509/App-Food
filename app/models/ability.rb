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
  end
end
