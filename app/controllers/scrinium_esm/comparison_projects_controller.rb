require_dependency "scrinium_esm/application_controller"

module ScriniumEsm
  class ComparisonProjectsController < ApplicationController
    before_action :authenticate_user!, except: [ :index, :show ]
    before_action :set_comparison_project, only: [ :show, :edit, :update, :destroy ]

    # GET /comparison_projects
    def index
      @comparison_projects = ComparisonProject.all
    end

    # GET /comparison_projects/1
    def show
    end

    # GET /comparison_projects/new
    def new
      @comparison_project = ComparisonProject.new
    end

    # GET /comparison_projects/1/edit
    def edit
    end

    # POST /comparison_projects
    def create
      @comparison_project = ComparisonProject.new(comparison_project_params)

      if @comparison_project.save
        redirect_to [ current_user, @comparison_project ], notice: t('message.create_success', thing: t('activerecord.models.scrinium_esm/comparison_project'))
      else
        render :new
      end
    end

    # PATCH/PUT /comparison_projects/1
    def update
      if @comparison_project.update(comparison_project_params)
        redirect_to [ current_user, @comparison_project ], notice: t('message.update_success', thing: t('activerecord.models.scrinium_esm/comparison_project'))
      else
        render :edit
      end
    end

    # DELETE /comparison_projects/1
    def destroy
      @comparison_project.destroy
      redirect_to comparison_projects_url, notice: t('message.destroy_success', thing: t('activerecord.models.scrinium_esm/comparison_project'))
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_comparison_project
      @comparison_project = ComparisonProject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comparison_project_params
      params.require(:comparison_project).permit(:name,
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
