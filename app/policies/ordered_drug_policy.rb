class OrderedDrugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def plus?
    true
  end

  def minus?
    true
  end
end
