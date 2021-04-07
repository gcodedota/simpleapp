class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Employee.new # guest user (not logged in)
    if user.inactivated?
      can %i[new create show edit update], Employee, id: user.id
    elsif user.admin?
      can :manage, Employee, organisation_id: user.organisation_id
      can %i[show edit update], Organisation, id: user.organisation_id
    elsif user.system?
      can :manage, :all
    else
      can %i[show], Organisation, id: user.organisation_id
      can %i[show edit update], Employee, id: user.id
    end
    end
end
