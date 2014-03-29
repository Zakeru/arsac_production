require 'test_helper'

class MaquinariaequiposControllerTest < ActionController::TestCase
  setup do
    @maquinariaequipo = maquinariaequipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maquinariaequipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maquinariaequipo" do
    assert_difference('Maquinariaequipo.count') do
      post :create, maquinariaequipo: { nombre: @maquinariaequipo.nombre, reportedemaquinaria_id: @maquinariaequipo.reportedemaquinaria_id }
    end

    assert_redirected_to maquinariaequipo_path(assigns(:maquinariaequipo))
  end

  test "should show maquinariaequipo" do
    get :show, id: @maquinariaequipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maquinariaequipo
    assert_response :success
  end

  test "should update maquinariaequipo" do
    put :update, id: @maquinariaequipo, maquinariaequipo: { nombre: @maquinariaequipo.nombre, reportedemaquinaria_id: @maquinariaequipo.reportedemaquinaria_id }
    assert_redirected_to maquinariaequipo_path(assigns(:maquinariaequipo))
  end

  test "should destroy maquinariaequipo" do
    assert_difference('Maquinariaequipo.count', -1) do
      delete :destroy, id: @maquinariaequipo
    end

    assert_redirected_to maquinariaequipos_path
  end
end
