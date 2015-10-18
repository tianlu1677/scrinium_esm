require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class CoupledModelsController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show]
    before_action :set_coupled_model, only: [:show, :edit, :update, :destroy]

    # GET /coupled_models
    def index
      @coupled_models = CoupledModel.all
    end

    # GET /coupled_models/1
    def show
    end

    # GET /coupled_models/new
    def new
      @coupled_model = CoupledModel.new
    end

    # GET /coupled_models/1/edit
    def edit
    end

    # POST /coupled_models
    def create
      @coupled_model = CoupledModel.new(coupled_model_params)

      if @coupled_model.save
        redirect_to @coupled_model, notice: t('message.create_success', thing: t('scrinium_esm.coupled_model'))
      else
        render :new
      end
    end

    # PATCH/PUT /coupled_models/1
    def update
      if @coupled_model.update(coupled_model_params)
        redirect_to @coupled_model, notice: t('message.update_success', thing: t('scrinium_esm.coupled_model'))
      else
        render :edit
      end
    end

    # DELETE /coupled_models/1
    def destroy
      @coupled_model.destroy
      redirect_to coupled_models_url, notice: t('message.destroy_success', thing: t('scrinium_esm.coupled_model'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_coupled_model
      @coupled_model = CoupledModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coupled_model_params
      params.require(:coupled_model).permit(:name,
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
