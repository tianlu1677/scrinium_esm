require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class OcnModelsController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show]
    before_action :set_ocn_model, only: [:show, :edit, :update, :destroy]

    # GET /ocn_models
    def index
      @ocn_models = OcnModel.all
    end

    # GET /ocn_models/1
    def show
    end

    # GET /ocn_models/new
    def new
      @ocn_model = OcnModel.new
    end

    # GET /ocn_models/1/edit
    def edit
    end

    # POST /ocn_models
    def create
      @ocn_model = OcnModel.new(ocn_model_params)

      if @ocn_model.save
        redirect_to @ocn_model, notice: t('message.create_success', thing: t('models.ocn'))
      else
        render :new
      end
    end

    # PATCH/PUT /ocn_models/1
    def update
      if @ocn_model.update(ocn_model_params)
        redirect_to @ocn_model, notice: t('message.update_success', thing: t('models.ocn'))
      else
        render :edit
      end
    end

    # DELETE /ocn_models/1
    def destroy
      @ocn_model.destroy
      redirect_to ocn_models_url, notice: t('message.destroy_success', thing: t('models.ocn'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_ocn_model
      @ocn_model = OcnModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ocn_model_params
      ApplicationHelper.transform_params params, :ocn_model,
        [:simulation_region, :simulation_type, :horizontal_mesh,
         :vertical_coordinate, :vertical_mesh]
      params.require(:ocn_model).permit(:name,
                                        :short_name,
                                        :contact_id,
                                        :repository_url,
                                        :description,
                                        :affiliation,
                                        :simulation_region,
                                        :simulation_type,
                                        :dynamical_core_scheme,
                                        :advection_scheme,
                                        :horizontal_mesh,
                                        :vertical_coordinate,
                                        :vertical_mesh)
    end
  end
end
