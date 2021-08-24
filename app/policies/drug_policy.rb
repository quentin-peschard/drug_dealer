class DrugPolicy < ApplicationPolicy
<<<<<<< drug_view
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
=======
    def resolve
        scope.all
    end
  
    def index?
        true
    end
end
>>>>>>> master
