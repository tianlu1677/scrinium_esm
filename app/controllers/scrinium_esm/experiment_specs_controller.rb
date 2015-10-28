require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ExperimentSpecsController < ApplicationController
    before_action :authenticate_user!, except: [ :index, :show ]
    before_action :load_comparison_project
    before_action :set_experiment_spec, only: [ :show, :edit, :update, :destroy ]

    def index
      @experiment_specs = ExperimentSpec.all
    end

    def show
    end

    def new
      @experiment_spec = @comparison_project.experiment_specs.new
    end

    def edit
    end

    def create
      @experiment_spec = @comparison_project.experiment_specs.new(experiment_spec_params)

      if @experiment_spec.save
        redirect_to [ @comparison_project, @experiment_spec ], notice: t('message.create_success', thing: t('activerecord.models.scrinium_esm/experiment_spec'))
      else
        render :new
      end
    end

    # PATCH/PUT /experiment_specs/1
    def update
      if @experiment_spec.update(experiment_spec_params)
        redirect_to [ @comparison_project, @experiment_spec ], notice: t('message.update_success', thing: t('activerecord.models.scrinium_esm/experiment_spec'))
      else
        render :edit
      end
    end

    # DELETE /experiment_specs/1
    def destroy
      @experiment_spec.destroy
      redirect_to experiment_specs_url, notice: t('message.destroy_success', thing: t('activerecord.models.scrinium_esm/experiment_spec'))
    end

    private

    def load_comparison_project
      comparison_project_id = request.path.match(/\/comparison_projects\/(\d+)/)[1]
      @comparison_project = ScriniumEsm::ComparisonProject.find(comparison_project_id)
    end

    def set_experiment_spec
      @experiment_spec = @comparison_project.experiment_specs.find(params[:id])
    end

    def experiment_spec_params
      params.require(:experiment_spec).permit(:name,
                                              :logo,
                                              :short_name,
                                              :description,
                                              :contact_id,
                                              :organization_id,
                                              :tag_list,
                                              { category_list: [] })
    end
  end
end
