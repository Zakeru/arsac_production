require 'test_helper'

class DiasControllerTest < ActionController::TestCase
  setup do
    @dia = dias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dia" do
    assert_difference('Dia.count') do
      post :create, dia: { nombre: @dia.nombre, numero: @dia.numero, tipodedia_id: @dia.tipodedia_id }
    end

    assert_redirected_to dia_path(assigns(:dia))
  end

  test "should show dia" do
    get :show, id: @dia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dia
    assert_response :success
  end

  test "should update dia" do
    put :update, id: @dia, dia: { nombre: @dia.nombre, numero: @dia.numero, tipodedia_id: @dia.tipodedia_id }
    assert_redirected_to dia_path(assigns(:dia))
  end

  test "should destroy dia" do
    assert_difference('Dia.count', -1) do
      delete :destroy, id: @dia
    end

    assert_redirected_to dias_path
  end
end
