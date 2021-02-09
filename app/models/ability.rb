class Ability
  include CanCan::Ability
  # def initialize(user)
  #   user ||= User.new
  #   if user.has_role? :admin
  #     can :manage, :all
  #   elsif user.has_role? :partner
  #     can :availables_properties, Property
  #   else
  #     can :read, :all
  #   end
  # end

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
