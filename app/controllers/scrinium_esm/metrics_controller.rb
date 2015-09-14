require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class MetricsController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :show]
    before_action :set_metric, only: [:show, :edit, :update, :destroy, :add_resource]

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

    def add_resource
      resource = Resource.new({
        name: "#{@metric.short_name} - #{I18n.t('scrinium.resource')} ##{@metric.resources.size+1}",
        category_list: [I18n.t('metric.resource')],
        user_id: current_user.id,
        resourceable_type: @metric.class,
        resourceable_id: @metric.id
      })
      if not resource.save
        # TODO: 处理错误。
      end
      if not @metric.update({ resource_ids: @metric.resource_ids << resource.id })
        # TODO: 处理错误。
      end
      redirect_to main_app.edit_user_resource_path(current_user, resource)
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
                                     { resource_ids: [] },
                                     :contact_id,
                                     :tag_list,
                                     { category_list: [] })
    end
  end
end
