require 'test_helper'

class MaestrodeobrasControllerTest < ActionController::TestCase
  setup do
    @maestrodeobra = maestrodeobras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maestrodeobras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maestrodeobra" do
    assert_difference('Maestrodeobra.count') do
      post :create, maestrodeobra: { banco_1: @maestrodeobra.banco_1, correo: @maestrodeobra.correo, ente_id: @maestrodeobra.ente_id, foto: @maestrodeobra.foto, jefedefrente_id: @maestrodeobra.jefedefrente_id, movil: @maestrodeobra.movil, nacimiento: @maestrodeobra.nacimiento, ruc: @maestrodeobra.ruc, telefono: @maestrodeobra.telefono }
    end

    assert_redirected_to maestrodeobra_path(assigns(:maestrodeobra))
  end

  test "should show maestrodeobra" do
    get :show, id: @maestrodeobra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maestrodeobra
    assert_response :success
  end

  test "should update maestrodeobra" do
    put :update, id: @maestrodeobra, maestrodeobra: { banco_1: @maestrodeobra.banco_1, correo: @maestrodeobra.correo, ente_id: @maestrodeobra.ente_id, foto: @maestrodeobra.foto, jefedefrente_id: @maestrodeobra.jefedefrente_id, movil: @maestrodeobra.movil, nacimiento: @maestrodeobra.nacimiento, ruc: @maestrodeobra.ruc, telefono: @maestrodeobra.telefono }
    assert_redirected_to maestrodeobra_path(assigns(:maestrodeobra))
  end

  test "should destroy maestrodeobra" do
    assert_difference('Maestrodeobra.count', -1) do
      delete :destroy, id: @maestrodeobra
    end

    assert_redirected_to maestrodeobras_path
  end
end
