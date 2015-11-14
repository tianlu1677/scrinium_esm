module ScriniumEsm
  class ApplicationController < ::ApplicationController
    set_current_tenant_through_filter
    before_filter :set_current_organization
    helper_method :current_organization

    def set_current_organization
      subdomain = request.subdomain
      if subdomain.present?
        @organization ||= Organization.find_by(subdomain: subdomain)
        set_current_tenant(@organization)
      end
    end

    # you can use current_organization in controllers and views
    def current_organization
      current_tenant
    end

  end
end
