class Ability
  include CanCan::Ability

  def initialize(user)
    # Logged in users abilities
    if user
      can :read, Invest
      can [:create, :update, :destroy], Invest, user_id: user.id
    end

    # Public abilities
    can :read, Invest
  end
end
