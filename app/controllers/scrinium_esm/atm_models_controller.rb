require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class AtmModelsController < ApplicationController
    before_action :set_atm_model, only: [:show, :edit, :update, :destroy]

    # GET /atm_models
    def index
      @atm_models = AtmModel.all
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

      if @atm_model.save
        redirect_to @atm_model, notice: 'Atm model was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /atm_models/1
    def update
      if @atm_model.update(atm_model_params)
        redirect_to @atm_model, notice: 'Atm model was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /atm_models/1
    def destroy
      @atm_model.destroy
      redirect_to atm_models_url, notice: 'Atm model was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_atm_model
        @atm_model = AtmModel.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def atm_model_params
        params.require(:atm_model).permit(:name, :description)
      end
  end
end
