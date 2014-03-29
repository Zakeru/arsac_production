require 'test_helper'

class ReportedeequiposControllerTest < ActionController::TestCase
  setup do
    @reportedeequipo = reportedeequipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reportedeequipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reportedeequipo" do
    assert_difference('Reportedeequipo.count') do
      post :create, reportedeequipo: { nombre: @reportedeequipo.nombre }
    end

    assert_redirected_to reportedeequipo_path(assigns(:reportedeequipo))
  end

  test "should show reportedeequipo" do
    get :show, id: @reportedeequipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reportedeequipo
    assert_response :success
  end

  test "should update reportedeequipo" do
    put :update, id: @reportedeequipo, reportedeequipo: { nombre: @reportedeequipo.nombre }
    assert_redirected_to reportedeequipo_path(assigns(:reportedeequipo))
  end

  test "should destroy reportedeequipo" do
    assert_difference('Reportedeequipo.count', -1) do
      delete :destroy, id: @reportedeequipo
    end

    assert_redirected_to reportedeequipos_path
  end
end
