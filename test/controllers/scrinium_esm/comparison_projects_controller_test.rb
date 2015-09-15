require 'test_helper'

module ScriniumEsm
  class ComparisonProjectsControllerTest < ActionController::TestCase
    setup do
      @comparison_project = scrinium_esm_comparison_projects(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:comparison_projects)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create comparison_project" do
      assert_difference('ComparisonProject.count') do
        post :create, comparison_project: { contact_id: @comparison_project.contact_id, description: @comparison_project.description, name: @comparison_project.name, short_name: @comparison_project.short_name }
      end

      assert_redirected_to comparison_project_path(assigns(:comparison_project))
    end

    test "should show comparison_project" do
      get :show, id: @comparison_project
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @comparison_project
      assert_response :success
    end

    test "should update comparison_project" do
      patch :update, id: @comparison_project, comparison_project: { contact_id: @comparison_project.contact_id, description: @comparison_project.description, name: @comparison_project.name, short_name: @comparison_project.short_name }
      assert_redirected_to comparison_project_path(assigns(:comparison_project))
    end

    test "should destroy comparison_project" do
      assert_difference('ComparisonProject.count', -1) do
        delete :destroy, id: @comparison_project
      end

      assert_redirected_to comparison_projects_path
    end
  end
end
