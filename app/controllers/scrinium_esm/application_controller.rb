module ScriniumEsm
  class ApplicationController < ::ApplicationController
    set_current_tenant_through_filter
    before_filter :set_current_organization

    def set_current_organization
      organization_id = params[:organization_id]
      @organization = Organization.find_by(id: organization_id)
      set_current_tenant(@organization)
    end

    helper_method :current_organization

    # you can use current_organization in controllers and views
    def current_organization
      current_tenant
    end

  end
end
