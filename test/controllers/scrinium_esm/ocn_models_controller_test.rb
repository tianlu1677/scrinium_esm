require 'test_helper'

module ScriniumEsm
  class OcnModelsControllerTest < ActionController::TestCase
    setup do
      @ocn_model = scrinium_esm_ocn_models(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:ocn_models)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create ocn_model" do
      assert_difference('OcnModel.count') do
        post :create, ocn_model: { contact_id: @ocn_model.contact_id, description: @ocn_model.description, name: @ocn_model.name, repository_url: @ocn_model.repository_url, short_name: @ocn_model.short_name }
      end

      assert_redirected_to ocn_model_path(assigns(:ocn_model))
    end

    test "should show ocn_model" do
      get :show, id: @ocn_model
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @ocn_model
      assert_response :success
    end

    test "should update ocn_model" do
      patch :update, id: @ocn_model, ocn_model: { contact_id: @ocn_model.contact_id, description: @ocn_model.description, name: @ocn_model.name, repository_url: @ocn_model.repository_url, short_name: @ocn_model.short_name }
      assert_redirected_to ocn_model_path(assigns(:ocn_model))
    end

    test "should destroy ocn_model" do
      assert_difference('OcnModel.count', -1) do
        delete :destroy, id: @ocn_model
      end

      assert_redirected_to ocn_models_path
    end
  end
end
