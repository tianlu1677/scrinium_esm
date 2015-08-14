require 'test_helper'

module ScriniumEsm
  class SeaIceModelsControllerTest < ActionController::TestCase
    setup do
      @sea_ice_model = scrinium_esm_sea_ice_models(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:sea_ice_models)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create sea_ice_model" do
      assert_difference('SeaIceModel.count') do
        post :create, sea_ice_model: { contact_id: @sea_ice_model.contact_id, description: @sea_ice_model.description, name: @sea_ice_model.name, repository_url: @sea_ice_model.repository_url, short_name: @sea_ice_model.short_name }
      end

      assert_redirected_to sea_ice_model_path(assigns(:sea_ice_model))
    end

    test "should show sea_ice_model" do
      get :show, id: @sea_ice_model
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @sea_ice_model
      assert_response :success
    end

    test "should update sea_ice_model" do
      patch :update, id: @sea_ice_model, sea_ice_model: { contact_id: @sea_ice_model.contact_id, description: @sea_ice_model.description, name: @sea_ice_model.name, repository_url: @sea_ice_model.repository_url, short_name: @sea_ice_model.short_name }
      assert_redirected_to sea_ice_model_path(assigns(:sea_ice_model))
    end

    test "should destroy sea_ice_model" do
      assert_difference('SeaIceModel.count', -1) do
        delete :destroy, id: @sea_ice_model
      end

      assert_redirected_to sea_ice_models_path
    end
  end
end
