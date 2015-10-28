require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ModelsController < ApplicationController
    def index
      @organization = Organization.find(session[:current_organization_id])
      id = session[:current_organization_id]
      @atm_models = AtmModel.where organization_id: id
      @ocn_models = OcnModel.where organization_id: id
      @lnd_models = LndModel.where organization_id: id
      @sea_ice_models = SeaIceModel.where organization_id: id
      @coupled_models = CoupledModel.where organization_id: id
    end
  end
end
