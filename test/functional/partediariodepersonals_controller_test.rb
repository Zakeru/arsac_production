require 'test_helper'

class PartediariodepersonalsControllerTest < ActionController::TestCase
  setup do
    @partediariodepersonal = partediariodepersonals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partediariodepersonals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partediariodepersonal" do
    assert_difference('Partediariodepersonal.count') do
      post :create, partediariodepersonal: { ejecutor: @partediariodepersonal.ejecutor, fecha: @partediariodepersonal.fecha, frente: @partediariodepersonal.frente, jefe_de_frente: @partediariodepersonal.jefe_de_frente, maestro_de_obra: @partediariodepersonal.maestro_de_obra, numero: @partediariodepersonal.numero, proveedore_id: @partediariodepersonal.proveedore_id }
    end

    assert_redirected_to partediariodepersonal_path(assigns(:partediariodepersonal))
  end

  test "should show partediariodepersonal" do
    get :show, id: @partediariodepersonal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partediariodepersonal
    assert_response :success
  end

  test "should update partediariodepersonal" do
    put :update, id: @partediariodepersonal, partediariodepersonal: { ejecutor: @partediariodepersonal.ejecutor, fecha: @partediariodepersonal.fecha, frente: @partediariodepersonal.frente, jefe_de_frente: @partediariodepersonal.jefe_de_frente, maestro_de_obra: @partediariodepersonal.maestro_de_obra, numero: @partediariodepersonal.numero, proveedore_id: @partediariodepersonal.proveedore_id }
    assert_redirected_to partediariodepersonal_path(assigns(:partediariodepersonal))
  end

  test "should destroy partediariodepersonal" do
    assert_difference('Partediariodepersonal.count', -1) do
      delete :destroy, id: @partediariodepersonal
    end

    assert_redirected_to partediariodepersonals_path
  end
end
