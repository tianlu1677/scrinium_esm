require 'test_helper'

module ScriniumEsm
  class AtmModelsControllerTest < ActionController::TestCase
    setup do
      @atm_model = scrinium_esm_atm_models(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:atm_models)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create atm_model" do
      assert_difference('AtmModel.count') do
        post :create, atm_model: { description: @atm_model.description, name: @atm_model.name }
      end

      assert_redirected_to atm_model_path(assigns(:atm_model))
    end

    test "should show atm_model" do
      get :show, id: @atm_model
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @atm_model
      assert_response :success
    end

    test "should update atm_model" do
      patch :update, id: @atm_model, atm_model: { description: @atm_model.description, name: @atm_model.name }
      assert_redirected_to atm_model_path(assigns(:atm_model))
    end

    test "should destroy atm_model" do
      assert_difference('AtmModel.count', -1) do
        delete :destroy, id: @atm_model
      end

      assert_redirected_to atm_models_path
    end
  end
end
