require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class SeaIceModelsController < ApplicationController
    before_action :authenticate_user!, :except => [ :index, :show ]
    before_action :set_sea_ice_model, only: [ :show, :edit, :update, :destroy ]

    # GET /sea_ice_models
    def index
      if session[:current_organization_id].present?
        @sea_ice_models = SeaIceModel.find_by_organization_id(session[:current_organization_id])
      else
        @sea_ice_models = SeaIceModel.all
      end
    end

    # GET /sea_ice_models/1
    def show
    end

    # GET /sea_ice_models/new
    def new
      @sea_ice_model = SeaIceModel.new
    end

    # GET /sea_ice_models/1/edit
    def edit
    end

    # POST /sea_ice_models
    def create
      @sea_ice_model = SeaIceModel.new(sea_ice_model_params)
      @sea_ice_model.organization_id = session[:current_organization_id]
      if @sea_ice_model.save!
        redirect_to @sea_ice_model, notice: t('message.create_success', thing: t('activerecord.models.scrinium_esm/sea_ice_model'))
      else
        render :new
      end
    end

    # PATCH/PUT /sea_ice_models/1
    def update
      if @sea_ice_model.update(sea_ice_model_params)
        redirect_to @sea_ice_model, notice: t('message.update_success', thing: t('activerecord.models.scrinium_esm/sea_ice_model'))
      else
        render :edit
      end
    end

    # DELETE /sea_ice_models/1
    def destroy
      @sea_ice_model.destroy
      redirect_to sea_ice_models_url, notice: t('message.destroy_success', thing: t('activerecord.models.scrinium_esm/sea_ice_model'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_sea_ice_model
      @sea_ice_model = SeaIceModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sea_ice_model_params
      params.require(:sea_ice_model).permit(:name,
                                            :short_name,
                                            :contact_id,
                                            :organization_id,
                                            :repository_url,
                                            :description,
                                            :affiliation,
                                            :simulation_region,
                                            :simulation_type)
    end
  end
end
