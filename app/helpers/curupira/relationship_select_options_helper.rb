module Curupira::RelationshipSelectOptionsHelper
  def active_user_groups_select_options(user)
      [["Selecione um grupo", nil]] + groups_by(user).map { |g| [g.name, g.id] }
  end

  def active_features_select_options
    [["Selecione uma funcionalidade", nil]] + Feature.all.map { |f| [f.name, f.id] }
  end

  def active_roles_select_options
    [["Selecione um perfil", nil]] + Role.all.map { |r| [r.name, r.id] }
  end

  def active_role_groups_select_options(group)
    [["Selecione um perfil", nil]] + Role.joins(:groups).where(groups:{id:group}).map { |r| [r.name, r.id] }
  end

  private 

  def groups_by(user)
    if user.admin
      Group.all
    else
      Group.joins(:users).where(users: { id: user }, active: true)
    end 
  end
end
