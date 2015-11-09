require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ExperimentsController < ApplicationController
    before_action :authenticate_user!, except: [ :index, :show ]
    before_action :set_experiment, only: [ :show, :edit, :update, :destroy, :add_log ]

    def index
      # @organization = Organization.find(session[:current_organization_id])
      # @experiments = Experiment.where organization_id: session[:current_organization_id]
      @experiments = Experiment.all  # this is select experiments with organizaton_id
    end

    def show
    end

    def new
      @experiment = Experiment.new
    end

    def edit
    end

    def create
      @experiment = Experiment.new(experiment_params)

      if @experiment.save
        # 添加集合成员。
        match = session[:previous_url].last.match(/\/experiments\/new\?experiment_id=(\d+)/)
        experiment_id = match ? match[1] : nil
        if experiment_id
          experiment_ensemble = ScriniumEsm::ExperimentEnsemble.new(
            experiment_id: experiment_id,
            member_id: @experiment.id
          )
          experiment_ensemble.save!
        end
        redirect_to @experiment, notice: t('message.create_success', thing: t('activerecord.models.scrinium_esm/experiment'))
      else
        render :new
      end
    end

    def update
      if @experiment.update(experiment_params)
        # 删除用户删除的试验操作。
        @experiment.experiment_actions.each do |action|
          if not params[:experiment][:experiment_actions_attributes]
            @experiment.experiment_actions.delete action
            action.destroy
            next
          end
          params[:experiment][:experiment_actions_attributes].map { |x| x.last }.each do |p|
            if p[:id] == action.id.to_s and p.keys.size == 1
              @experiment.experiment_actions.delete action
              action.destroy
              break
            end
          end
        end
        redirect_to @experiment, notice: t('message.update_success', thing: t('activerecord.models.scrinium_esm/experiment'))
      else
        render :edit
      end
    end

    def destroy
      @experiment.destroy
      redirect_to experiments_url, notice: t('message.destroy_success', thing: t('activerecord.models.scrinium_esm/experiment'))
    end

    def add_log
      log = Article.new({
        title: "#{@experiment.name} - #{I18n.t('experiment.log')} ##{@experiment.log_ids.size+1}",
        category_list: [I18n.t('experiment.log')],
        user_id: current_user.id,
        privacy: 'public'
      })
      log.save!
      @experiment.update!({ log_ids: @experiment.log_ids << log.id })
      redirect_to main_app.edit_article_path(log)
    end

    private

    def set_experiment
      @experiment = Experiment.find(params[:id])
    end

    def experiment_params
      params[:experiment][:experimentable_type] = ScriniumEsm::Experiment::ModelType[params[:experiment][:experiment_type].to_sym]
      if params[:experiment][:experiment_actions_attributes].present?
        order = 0
        params[:experiment][:experiment_actions_attributes].values.each do |action|
          action[:order] = order
          order += 1
        end
      end
      params.require(:experiment).permit(:name,
                                         :description,
                                         :contact_id,
                                         :organization_id,
                                         :tag_list,
                                         { category_list: [] },
                                         :experiment_type,
                                         :experimentable_id,
                                         :experimentable_type,
                                         { log_ids: [] },
                                         experiment_actions_attributes: [
                                           :id,
                                           :order,
                                           :action_object,
                                           :action_type,
                                           :content1,
                                           :content2,
                                           :content3,
                                           :content4,
                                           :content5
                                         ])
    end
  end
end
