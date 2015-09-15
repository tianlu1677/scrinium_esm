require 'test_helper'

module ScriniumEsm
  class ExperimentSpecsControllerTest < ActionController::TestCase
    setup do
      @experiment_spec = scrinium_esm_experiment_specs(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:experiment_specs)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create experiment_spec" do
      assert_difference('ExperimentSpec.count') do
        post :create, experiment_spec: { contact_id: @experiment_spec.contact_id, description: @experiment_spec.description, name: @experiment_spec.name, short_name: @experiment_spec.short_name }
      end

      assert_redirected_to experiment_spec_path(assigns(:experiment_spec))
    end

    test "should show experiment_spec" do
      get :show, id: @experiment_spec
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @experiment_spec
      assert_response :success
    end

    test "should update experiment_spec" do
      patch :update, id: @experiment_spec, experiment_spec: { contact_id: @experiment_spec.contact_id, description: @experiment_spec.description, name: @experiment_spec.name, short_name: @experiment_spec.short_name }
      assert_redirected_to experiment_spec_path(assigns(:experiment_spec))
    end

    test "should destroy experiment_spec" do
      assert_difference('ExperimentSpec.count', -1) do
        delete :destroy, id: @experiment_spec
      end

      assert_redirected_to experiment_specs_path
    end
  end
end
