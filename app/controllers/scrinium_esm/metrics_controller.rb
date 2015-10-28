require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class MetricsController < ApplicationController
    before_action :authenticate_user!, :except => [ :index, :show ]
    before_action :set_metric, only: [ :show, :edit, :update, :destroy, :add_resource ]

    # GET /metrics
    def index
      @metrics = Metric.all
    end

    # GET /metrics/1
    def show
    end

    # GET /metrics/new
    def new
      @metric = Metric.new
    end

    # GET /metrics/1/edit
    def edit
    end

    # POST /metrics
    def create
      @metric = Metric.new(metric_params)

      if @metric.save
        redirect_to [ current_user, @metric ], notice: t('message.create_success', thing: t('scrinium_esm.metric'))
      else
        render :new
      end
    end

    # PATCH/PUT /metrics/1
    def update
      if @metric.update(metric_params)
        redirect_to [ current_user, @metric ], notice: t('message.update_success', thing: t('scrinium_esm.metric'))
      else
        render :edit
      end
    end

    # DELETE /metrics/1
    def destroy
      @metric.destroy
      redirect_to metrics_url, notice: t('message.destroy_success', thing: t('scrinium_esm.metric'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metric_params
      params.require(:metric).permit(:name,
                                     :short_name,
                                     :description,
                                     :contact_id,
                                     :organization_id,
                                     :tag_list,
                                     { category_list: [] })
    end
  end
end
