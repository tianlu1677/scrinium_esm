require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ModelsController < ApplicationController
    def index
      if params.has_key? :organization_id
        id = params[:organization_id].to_i
        @atm_models = [ AtmModel.find_by_organization_id(id) ].flatten.compact
        @ocn_models = [ OcnModel.find_by_organization_id(id) ].flatten.compact
        @lnd_models = [ LndModel.find_by_organization_id(id) ].flatten.compact
        @sea_ice_models = [ SeaIceModel.find_by_organization_id(id) ].flatten.compact
        @coupled_models = [ CoupledModel.find_by_organization_id(id) ].flatten.compact
      else
        @atm_models = AtmModel.all
        @ocn_models = OcnModel.all
        @lnd_models = LndModel.all
        @sea_ice_models = SeaIceModel.all
        @coupled_models = CoupledModel.all
      end
    end
  end
end
