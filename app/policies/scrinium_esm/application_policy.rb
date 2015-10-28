module ScriniumEsm
  class ApplicationPolicy
    attr_reader :user, :record, :organization

    def initialize(user, record)
      @user = user
      @record = record
      @organization = nil
      if user
        user.memberships.each do |membership|
          next if not membership.status == 'approved'
          next if not membership.host_type == 'Organization'
          organization = membership.host
          organization.licenses.each do |license|
            next if not license.engine_name == 'scrinium_esm'
            @organization = organization
          end
        end
      end
    end

    def login?
      user
    end

    def admin?
      organization and user.id == organization.admin_id
    end

    def owner?
      user.id == record.contact_id
    end

    def index?
      false
    end

    def show?
      scope.where(:id => record.id).exists?
    end

    def create?
      false
    end

    def new?
      create?
    end

    def update?
      false
    end

    def edit?
      update?
    end

    def destroy?
      false
    end

    def scope
      Pundit.policy_scope!(user, record.class)
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        scope
      end
    end
  end
end
