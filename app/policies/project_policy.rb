class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true  # Anyone can view a project
  end

  def create?
    record.user == user.admin  # Only connected user can create a project
  end

  def update?
    record.user == user.admin  # Only project creator can update it
  end

  def destroy?
    record.user == user.admin  # Only project creator can destroy it
  end
end
