class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, Thing, user_id: user.id
  end

end
