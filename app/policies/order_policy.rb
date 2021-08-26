class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def new
      scope.where(user: user)
    end

    def create
      scope.where(user: user)
    end


  end

  def readyStatus?
    true
  end

  def pendingStatus?
    true
  end

  def completeStatus?
    true
  end
end
