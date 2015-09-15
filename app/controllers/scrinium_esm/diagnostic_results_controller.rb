require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class DiagnosticResultsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :load_user_and_experiment
    before_action :set_diagnostic_result, only: [:show, :edit, :update, :destroy]

    # GET /diagnostic_results
    def index
      @diagnostic_results = DiagnosticResult.all
    end

    # GET /diagnostic_results/1
    def show
    end

    # GET /diagnostic_results/new
    def new
      @diagnostic_result = DiagnosticResult.new
    end

    # GET /diagnostic_results/1/edit
    def edit
    end

    # POST /diagnostic_results
    def create
      @diagnostic_result = DiagnosticResult.new(diagnostic_result_params)
      @diagnostic_result.experiment = @experiment

      if @diagnostic_result.save
        redirect_to [ current_user, @experiment, @diagnostic_result ], notice: t('message.create_success', thing: t('scrinium_esm.diagnostic_result'))
      else
        render :new
      end
    end

    # PATCH/PUT /diagnostic_results/1
    def update
      if @diagnostic_result.update(diagnostic_result_params)
        redirect_to [ current_user, @experiment, @diagnostic_result ], notice:  t('message.update_success', thing: t('scrinium_esm.diagnostic_result'))
      else
        render :edit
      end
    end

    # DELETE /diagnostic_results/1
    def destroy
      @diagnostic_result.destroy
      redirect_to scrinium_esm.user_experiment_path(current_user, @experiment), notice:  t('message.destroy_success', thing: t('scrinium_esm.diagnostic_result'))
    end

    private

    def load_user_and_experiment
      user_id, experiment_id = request.path.match(/\/users\/(\d+)\/experiments\/(\d+)/)[1,2]
      @user = User.find(user_id)
      @experiment = ScriniumEsm::Experiment.find(experiment_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_diagnostic_result
      @diagnostic_result = DiagnosticResult.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diagnostic_result_params
      params.require(:diagnostic_result).permit(:name,
                                                :short_name,
                                                :description,
                                                { resource_ids: [] },
                                                :contact_id,
                                                :tag_list,
                                                { category_list: [] },
                                                :experiment_id,
                                                :metric_id)
    end
  end
end
