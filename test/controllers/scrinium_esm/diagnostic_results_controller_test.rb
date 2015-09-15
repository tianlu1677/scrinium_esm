require 'test_helper'

module ScriniumEsm
  class DiagnosticResultsControllerTest < ActionController::TestCase
    setup do
      @diagnostic_result = scrinium_esm_diagnostic_results(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:diagnostic_results)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create diagnostic_result" do
      assert_difference('DiagnosticResult.count') do
        post :create, diagnostic_result: {  }
      end

      assert_redirected_to diagnostic_result_path(assigns(:diagnostic_result))
    end

    test "should show diagnostic_result" do
      get :show, id: @diagnostic_result
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @diagnostic_result
      assert_response :success
    end

    test "should update diagnostic_result" do
      patch :update, id: @diagnostic_result, diagnostic_result: {  }
      assert_redirected_to diagnostic_result_path(assigns(:diagnostic_result))
    end

    test "should destroy diagnostic_result" do
      assert_difference('DiagnosticResult.count', -1) do
        delete :destroy, id: @diagnostic_result
      end

      assert_redirected_to diagnostic_results_path
    end
  end
end
