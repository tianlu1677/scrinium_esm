require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class OcnModelsController < ApplicationController
    before_action :authenticate_user!, :except => [ :index, :show ]
    before_action :set_ocn_model, only: [ :show, :edit, :update, :destroy ]

    def index
      if session[:current_organization_id].present?
        @ocn_models = OcnModel.find_by_organization_id(session[:current_organization_id])
      else
        @ocn_models = OcnModel.all
      end
    end

    def show
    end

    def new
      @ocn_model = OcnModel.new
    end

    def edit
    end

    def create
      @ocn_model = OcnModel.new(ocn_model_params)
      @ocn_model.organization_id = session[:current_organization_id]
      if @ocn_model.save!
        redirect_to @ocn_model, notice: t('message.create_success', thing: t('activerecord.models.scrinium_esm/ocn_model'))
      else
        render :new
      end
    end

    def update
      if @ocn_model.update!(ocn_model_params)
        redirect_to @ocn_model, notice: t('message.update_success', thing: t('activerecord.models.scrinium_esm/ocn_model'))
      else
        render :edit
      end
    end

    def destroy
      @ocn_model.destroy
      redirect_to ocn_models_url, notice: t('message.destroy_success', thing: t('activerecord.models.scrinium_esm/ocn_model'))
    end

    private

    def set_ocn_model
      @ocn_model = OcnModel.find(params[:id])
    end

    def ocn_model_params
      params.require(:ocn_model).permit(:name,
                                        :short_name,
                                        :contact_id,
                                        :organization_id,
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
