require 'test_helper'

class VpartidasControllerTest < ActionController::TestCase
  setup do
    @vpartida = vpartidas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vpartidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vpartida" do
    assert_difference('Vpartida.count') do
      post :create, vpartida: { cantidad: @vpartida.cantidad, codigo: @vpartida.codigo, parcial: @vpartida.parcial, partida_nombre: @vpartida.partida_nombre, precio_unitario: @vpartida.precio_unitario, unidad: @vpartida.unidad, valorizacione_id: @vpartida.valorizacione_id }
    end

    assert_redirected_to vpartida_path(assigns(:vpartida))
  end

  test "should show vpartida" do
    get :show, id: @vpartida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vpartida
    assert_response :success
  end

  test "should update vpartida" do
    put :update, id: @vpartida, vpartida: { cantidad: @vpartida.cantidad, codigo: @vpartida.codigo, parcial: @vpartida.parcial, partida_nombre: @vpartida.partida_nombre, precio_unitario: @vpartida.precio_unitario, unidad: @vpartida.unidad, valorizacione_id: @vpartida.valorizacione_id }
    assert_redirected_to vpartida_path(assigns(:vpartida))
  end

  test "should destroy vpartida" do
    assert_difference('Vpartida.count', -1) do
      delete :destroy, id: @vpartida
    end

    assert_redirected_to vpartidas_path
  end
end
