require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ExperimentSpecsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :load_user_and_comparison_project
    before_action :set_experiment_spec, only: [:show, :edit, :update, :destroy]

    # GET /experiment_specs
    def index
      @experiment_specs = ExperimentSpec.all
    end

    # GET /experiment_specs/1
    def show
    end

    # GET /experiment_specs/new
    def new
      @experiment_spec = @comparison_project.experiment_specs.new
    end

    # GET /experiment_specs/1/edit
    def edit
    end

    # POST /experiment_specs
    def create
      @experiment_spec = @comparison_project.experiment_specs.new(experiment_spec_params)

      if @experiment_spec.save
        redirect_to [@user, @comparison_project, @experiment_spec ], notice: t('message.create_success', thing: t('scrinium_esm.experiment_spec'))
      else
        render :new
      end
    end

    # PATCH/PUT /experiment_specs/1
    def update
      if @experiment_spec.update(experiment_spec_params)
        redirect_to [@user, @comparison_project, @experiment_spec ], notice: t('message.update_success', thing: t('scrinium_esm.experiment_spec'))
      else
        render :edit
      end
    end

    # DELETE /experiment_specs/1
    def destroy
      @experiment_spec.destroy
      redirect_to experiment_specs_url, notice: t('message.destroy_success', thing: t('scrinium_esm.experiment_spec'))
    end

    private

    def load_user_and_comparison_project
      user_id, comparison_project_id = request.path.match(/\/users\/(\d+)\/comparison_projects\/(\d+)/)[1,2]
      @user = User.find(user_id)
      @comparison_project = ScriniumEsm::ComparisonProject.find(comparison_project_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_experiment_spec
      @experiment_spec = @comparison_project.experiment_specs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
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
