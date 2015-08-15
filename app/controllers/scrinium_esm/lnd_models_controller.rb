require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class LndModelsController < ApplicationController
    before_filter :authenticate_user!, :except => [:index, :show]
    before_action :set_lnd_model, only: [:show, :edit, :update, :destroy]

    # GET /lnd_models
    def index
      @lnd_models = LndModel.all
    end

    # GET /lnd_models/1
    def show
    end

    # GET /lnd_models/new
    def new
      @lnd_model = LndModel.new
    end

    # GET /lnd_models/1/edit
    def edit
    end

    # POST /lnd_models
    def create
      @lnd_model = LndModel.new(lnd_model_params)

      if @lnd_model.save
        redirect_to @lnd_model, notice: t('message.create_success', thing: t('models.lnd'))
      else
        render :new
      end
    end

    # PATCH/PUT /lnd_models/1
    def update
      if @lnd_model.update(lnd_model_params)
        redirect_to @lnd_model, notice: t('message.update_success', thing: t('models.lnd'))
      else
        render :edit
      end
    end

    # DELETE /lnd_models/1
    def destroy
      @lnd_model.destroy
      redirect_to lnd_models_url, notice: t('message.destroy_success', thing: t('models.lnd'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_lnd_model
      @lnd_model = LndModel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lnd_model_params
      params.require(:lnd_model).permit(:name,
                                        :short_name,
                                        :contact_id,
                                        :repository_url,
                                        :description
                                        :affiliation,
                                        :simulation_region,
                                        :simulation_type)
    end
  end
end
