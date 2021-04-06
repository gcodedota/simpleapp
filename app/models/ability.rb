class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Employee.new # guest user (not logged in)
    Rails.logger.info "#{user.role} #{user.system?} =================="
    if user.admin?
      can %i[index show new edit create update destroy], Employee, organisation_id: user.organisation_id
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
