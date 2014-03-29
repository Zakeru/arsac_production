require 'test_helper'

class ReportedemaquinariasControllerTest < ActionController::TestCase
  setup do
    @reportedemaquinaria = reportedemaquinarias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reportedemaquinarias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reportedemaquinaria" do
    assert_difference('Reportedemaquinaria.count') do
      post :create, reportedemaquinaria: { nombre: @reportedemaquinaria.nombre }
    end

    assert_redirected_to reportedemaquinaria_path(assigns(:reportedemaquinaria))
  end

  test "should show reportedemaquinaria" do
    get :show, id: @reportedemaquinaria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reportedemaquinaria
    assert_response :success
  end

  test "should update reportedemaquinaria" do
    put :update, id: @reportedemaquinaria, reportedemaquinaria: { nombre: @reportedemaquinaria.nombre }
    assert_redirected_to reportedemaquinaria_path(assigns(:reportedemaquinaria))
  end

  test "should destroy reportedemaquinaria" do
    assert_difference('Reportedemaquinaria.count', -1) do
      delete :destroy, id: @reportedemaquinaria
    end

    assert_redirected_to reportedemaquinarias_path
  end
end
