class DrugPolicy < ApplicationPolicy
    def resolve
        scope.all
    end
  
    def index?
        true
    end
end