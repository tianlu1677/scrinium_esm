require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ModelsController < ApplicationController
    def index
      @organization = Organization.find(session[:current_organization_id])
      id = session[:current_organization_id]
      @atm_models = [ AtmModel.find_by_organization_id(id) ].flatten.compact
      @ocn_models = [ OcnModel.find_by_organization_id(id) ].flatten.compact
      @lnd_models = [ LndModel.find_by_organization_id(id) ].flatten.compact
      @sea_ice_models = [ SeaIceModel.find_by_organization_id(id) ].flatten.compact
      @coupled_models = [ CoupledModel.find_by_organization_id(id) ].flatten.compact
    end
  end
end
