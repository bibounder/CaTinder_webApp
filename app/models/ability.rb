class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin?)
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    elsif user.try(:staff?)
      can :manage, :cat_likes
    end
  end
end
