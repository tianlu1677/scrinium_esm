require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ExperimentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_experiment, only: [:show, :edit, :update, :destroy, :add_log]

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
        # 添加集合成员。
        match = session[:previous_url].match(/\/experiments\/new\?experiment_id=(\d+)/)
        experiment_id = match ? match[1] : nil
        if experiment_id
          experiment_ensemble = ScriniumEsm::ExperimentEnsemble.new(
            experiment_id: experiment_id,
            member_id: @experiment.id
          )
          if not experiment_ensemble.save
            # TODO: 处理错误！
          end
        end

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

    def add_log
      log = Article.new({
        title: "#{@experiment.name} - #{I18n.t('experiment.log')} ##{@experiment.log_ids.size+1}",
        category_list: [I18n.t('experiment.log')],
        user_id: current_user.id
      })
      if not log.save
        # TODO: 处理错误。
      end
      if not @experiment.update({ log_ids: @experiment.log_ids << log.id })
        # TODO: 处理错误。
      end
      redirect_to main_app.edit_user_article_path(current_user, log)
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
                                         :experimentable_type,
                                         { log_ids: [] })
    end
  end
end
