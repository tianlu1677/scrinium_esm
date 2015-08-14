require 'test_helper'

module ScriniumEsm
  class LndModelsControllerTest < ActionController::TestCase
    setup do
      @lnd_model = scrinium_esm_lnd_models(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:lnd_models)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create lnd_model" do
      assert_difference('LndModel.count') do
        post :create, lnd_model: { contact_id: @lnd_model.contact_id, description: @lnd_model.description, name: @lnd_model.name, repository_url: @lnd_model.repository_url, short_name: @lnd_model.short_name }
      end

      assert_redirected_to lnd_model_path(assigns(:lnd_model))
    end

    test "should show lnd_model" do
      get :show, id: @lnd_model
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @lnd_model
      assert_response :success
    end

    test "should update lnd_model" do
      patch :update, id: @lnd_model, lnd_model: { contact_id: @lnd_model.contact_id, description: @lnd_model.description, name: @lnd_model.name, repository_url: @lnd_model.repository_url, short_name: @lnd_model.short_name }
      assert_redirected_to lnd_model_path(assigns(:lnd_model))
    end

    test "should destroy lnd_model" do
      assert_difference('LndModel.count', -1) do
        delete :destroy, id: @lnd_model
      end

      assert_redirected_to lnd_models_path
    end
  end
end
