require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ExperimentsController < ApplicationController
    before_action :set_experiment, only: [:show, :edit, :update, :destroy]

    # GET /experiments
    def index
      @experiments = Experiment.all
    end

    # GET /experiments/1
    def show
    end

    # GET /experiments/new
    def new
      @experiment = Experiment.new
    end

    # GET /experiments/1/edit
    def edit
    end

    # POST /experiments
    def create
      @experiment = Experiment.new(experiment_params)

      if @experiment.save
        redirect_to [@experiment.user, @experiment], notice: t('message.create_success', thing: t('scrinium_esm.experiment'))
      else
        render :new
      end
    end

    # PATCH/PUT /experiments/1
    def update
      if @experiment.update(experiment_params)
        redirect_to [@experiment.user, @experiment], notice: t('message.update_success', thing: t('scrinium_esm.experiment'))
      else
        render :edit
      end
    end

    # DELETE /experiments/1
    def destroy
      @experiment.destroy
      redirect_to experiments_url, notice: t('message.destroy_success', thing: t('scrinium_esm.experiment'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_experiment
      @experiment = Experiment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def experiment_params
      params[:experiment][:experimentable_type] =
        ScriniumEsm::Experiment::TypeMap[params[:experiment][:experimentable_type]]
      params[:experiment][:action_types] = params[:action_types] ? params[:action_types].split(',') : []
      params[:experiment][:action_subjects] = params[:action_subjects] ? params[:action_subjects].split(',') : []
      params.require(:experiment).permit(:name,
                                         :description,
                                         :contact_id,
                                         { action_types: [] },
                                         { action_subjects: [] },
                                         :tag_list,
                                         { category_list: [] },
                                         :experimentable_id,
                                         :experimentable_type)
    end
  end
end
