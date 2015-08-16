require 'test_helper'

module ScriniumEsm
  class ExperimentsControllerTest < ActionController::TestCase
    setup do
      @experiment = scrinium_esm_experiments(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:experiments)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create experiment" do
      assert_difference('Experiment.count') do
        post :create, experiment: { contact_id: @experiment.contact_id, description: @experiment.description, experimentable_id: @experiment.experimentable_id, experimentable_type: @experiment.experimentable_type, name: @experiment.name }
      end

      assert_redirected_to experiment_path(assigns(:experiment))
    end

    test "should show experiment" do
      get :show, id: @experiment
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @experiment
      assert_response :success
    end

    test "should update experiment" do
      patch :update, id: @experiment, experiment: { contact_id: @experiment.contact_id, description: @experiment.description, experimentable_id: @experiment.experimentable_id, experimentable_type: @experiment.experimentable_type, name: @experiment.name }
      assert_redirected_to experiment_path(assigns(:experiment))
    end

    test "should destroy experiment" do
      assert_difference('Experiment.count', -1) do
        delete :destroy, id: @experiment
      end

      assert_redirected_to experiments_path
    end
  end
end
