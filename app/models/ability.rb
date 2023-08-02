class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :manage, Recipe, public: true
    cannot :destroy, Recipe
    cannot :create, Recipe

    can :manage, :all if user.role == 'admin'

    return unless user.role == 'user'

    can :manage, Food
    can :manage, Recipe, user_id: user.id
  end
end
