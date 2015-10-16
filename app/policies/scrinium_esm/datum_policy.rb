module ScriniumEsm
  class DatumPolicy < ScriniumEsm::ApplicationPolicy
    def create?
      login? and organization
    end

    def update?
      create? and ( owner? or admin? )
    end

    def destroy?
      create? and ( owner? or admin? )
    end

    class Scope < Scope
      def resolve
        scope
      end
    end
  end
end
