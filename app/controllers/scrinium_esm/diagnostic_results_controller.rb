require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class DiagnosticResultsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_diagnostic_result, only: [:show, :edit, :update, :destroy]

    def index
      @diagnostic_results = DiagnosticResult.all
    end

    def show
    end

    def new
      @diagnostic_result = DiagnosticResult.new
    end

    def edit
    end

    def create
      @diagnostic_result = DiagnosticResult.new(diagnostic_result_params)
      match = session[:previous_url].last.match(/\/diagnostic_results\/new\?experiment_id=(\d+)/)
      experiment_id = match ? match[1] : nil
      @diagnostic_result.experiment = Experiment.find(experiment_id)

      if @diagnostic_result.save
        redirect_to [ @experiment, @diagnostic_result ], notice: t('message.create_success', thing: t('scrinium_esm.diagnostic_result'))
      else
        render :new
      end
    end

    def update
      if @diagnostic_result.update(diagnostic_result_params)
        redirect_to [ @experiment, @diagnostic_result ], notice:  t('message.update_success', thing: t('scrinium_esm.diagnostic_result'))
      else
        render :edit
      end
    end

    def destroy
      @diagnostic_result.destroy
      redirect_to scrinium_esm.user_experiment_path(current_user, @experiment), notice:  t('message.destroy_success', thing: t('scrinium_esm.diagnostic_result'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostic_result
      @diagnostic_result = DiagnosticResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diagnostic_result_params
      params.require(:diagnostic_result).permit(:name,
                                                :short_name,
                                                :description,
                                                :contact_id,
                                                :tag_list,
                                                { category_list: [] },
                                                :experiment_id,
                                                :metric_id)
    end
  end
end
