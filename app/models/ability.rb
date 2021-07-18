# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, User, user_id: user.id
    can :manage, Booking, user_id: user.id
    can :manage, :all if user.is_admin
    cannot :destroy, :all if user.is_admin
  end
end
