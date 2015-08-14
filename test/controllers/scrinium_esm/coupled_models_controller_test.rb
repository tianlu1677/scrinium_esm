require 'test_helper'

module ScriniumEsm
  class CoupledModelsControllerTest < ActionController::TestCase
    setup do
      @coupled_model = scrinium_esm_coupled_models(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:coupled_models)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create coupled_model" do
      assert_difference('CoupledModel.count') do
        post :create, coupled_model: { contact_id: @coupled_model.contact_id, description: @coupled_model.description, name: @coupled_model.name, repository_url: @coupled_model.repository_url, short_name: @coupled_model.short_name }
      end

      assert_redirected_to coupled_model_path(assigns(:coupled_model))
    end

    test "should show coupled_model" do
      get :show, id: @coupled_model
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @coupled_model
      assert_response :success
    end

    test "should update coupled_model" do
      patch :update, id: @coupled_model, coupled_model: { contact_id: @coupled_model.contact_id, description: @coupled_model.description, name: @coupled_model.name, repository_url: @coupled_model.repository_url, short_name: @coupled_model.short_name }
      assert_redirected_to coupled_model_path(assigns(:coupled_model))
    end

    test "should destroy coupled_model" do
      assert_difference('CoupledModel.count', -1) do
        delete :destroy, id: @coupled_model
      end

      assert_redirected_to coupled_models_path
    end
  end
end
