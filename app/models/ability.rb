class Ability
  include CanCan::Ability

  def initialize(user)
    # Logged in users abilities
    if user
      can :read, User
      can :update, User, id: user.id
      can :read, Invest
      can [:create, :update, :destroy], Invest, user_id: user.id
      can :create, Status
      can [:index, :show, :create], Team
      can :update, Team, owner: user
    end

    # Public abilities
    can :read, Invest
  end
end
