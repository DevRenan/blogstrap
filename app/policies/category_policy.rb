class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.admin? || user.has_role?(:moderator)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end

    def index?
      user.admin?
    end

    def create?
      user.admin?
    end

    def update?
      user.admin?
    end

    def destroy
      user.admin?
    end
  end
end
