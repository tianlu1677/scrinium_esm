require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class AtmModelsController < ApplicationController
    before_action :authenticate_user!, :except => [ :index, :show ]
    before_action :set_atm_model, only: [ :show, :edit, :update, :destroy ]

    # GET /atm_models
    def index
      if session[:current_organization_id].present?
        @atm_models = AtmModel.where organization_id: session[:current_organization_id]
      else
        @atm_models = AtmModel.all
      end
    end

    # GET /atm_models/1
    def show
    end

    # GET /atm_models/new
    def new
      @atm_model = AtmModel.new
    end

    # GET /atm_models/1/edit
    def edit
    end

    # POST /atm_models
    def create
      @atm_model = AtmModel.new(atm_model_params)
      @atm_model.organization_id = session[:current_organization_id]
      if @atm_model.save
        redirect_to @atm_model, notice: t('message.create_success', thing: t('activerecord.models.scrinium_esm/atm_model'))
      else
        render :new
      end
    end

    # PATCH/PUT /atm_models/1
    def update
      if @atm_model.update(atm_model_params)
        redirect_to @atm_model, notice: t('message.update_success', thing: t('activerecord.models.scrinium_esm/atm_model'))
      else
        render :edit
      end
    end

    # DELETE /atm_models/1
    def destroy
      @atm_model.destroy
      redirect_to atm_models_url, notice: t('message.destroy_success', thing: t('activerecord.models.scrinium_esm/atm_model'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_atm_model
      @atm_model = AtmModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def atm_model_params
      params.require(:atm_model).permit(:name,
                                        :short_name,
                                        :description,
                                        :contact_id,
                                        :organization_id,
                                        :affiliation,
                                        :simulation_region,
                                        :simulation_type,
                                        :is_hydrostatic,
                                        :is_shallow,
                                        :horizontal_mesh,
                                        :vertical_coordinate,
                                        :vertical_mesh,
                                        :dynamical_core_scheme,
                                        :advection_scheme,
                                        :radiation_scheme,
                                        :convection_scheme,
                                        :microphysics_scheme,
                                        :planet_boundary_layer_scheme,
                                        :gravity_drag_scheme)
    end
  end
end
