class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :manage, :all if user.role == 'admin'

    return unless user.role == 'user'

    can :create, Food
    can :destroy, Food
    can :create, Recipe, user_id: user.id
    can :destroy, Recipe, user_id: user.id
  end
end
