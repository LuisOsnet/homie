class Ability
  include CanCan::Ability
  def initialize(user)
    send("#{user.roles.last.name}_abilities")
  end

  def admin_abilities
    can :manage, :all
  end

  def partner_abilities
    can :read, :all
    can :availables_properties, Property
  end

  def visitor_abilities
    can :read, :all
  end
end
