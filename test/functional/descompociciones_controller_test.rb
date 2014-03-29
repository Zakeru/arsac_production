require 'test_helper'

class DescompocicionesControllerTest < ActionController::TestCase
  setup do
    @descompocicione = descompociciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:descompociciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create descompocicione" do
    assert_difference('Descompocicione.count') do
      post :create, descompocicione: { cantidad: @descompocicione.cantidad, cantidadvales: @descompocicione.cantidadvales, descripcion: @descompocicione.descripcion, observacion: @descompocicione.observacion, parteobra_id: @descompocicione.parteobra_id, terreno: @descompocicione.terreno, unidad: @descompocicione.unidad }
    end

    assert_redirected_to descompocicione_path(assigns(:descompocicione))
  end

  test "should show descompocicione" do
    get :show, id: @descompocicione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @descompocicione
    assert_response :success
  end

  test "should update descompocicione" do
    put :update, id: @descompocicione, descompocicione: { cantidad: @descompocicione.cantidad, cantidadvales: @descompocicione.cantidadvales, descripcion: @descompocicione.descripcion, observacion: @descompocicione.observacion, parteobra_id: @descompocicione.parteobra_id, terreno: @descompocicione.terreno, unidad: @descompocicione.unidad }
    assert_redirected_to descompocicione_path(assigns(:descompocicione))
  end

  test "should destroy descompocicione" do
    assert_difference('Descompocicione.count', -1) do
      delete :destroy, id: @descompocicione
    end

    assert_redirected_to descompociciones_path
  end
end
