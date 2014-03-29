require 'test_helper'

class VmanodeobrasControllerTest < ActionController::TestCase
  setup do
    @vmanodeobra = vmanodeobras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vmanodeobras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vmanodeobra" do
    assert_difference('Vmanodeobra.count') do
      post :create, vmanodeobra: { cantidad: @vmanodeobra.cantidad, nombre: @vmanodeobra.nombre, parcial: @vmanodeobra.parcial, precio_unitario: @vmanodeobra.precio_unitario, unidad: @vmanodeobra.unidad, valorizacione_id: @vmanodeobra.valorizacione_id }
    end

    assert_redirected_to vmanodeobra_path(assigns(:vmanodeobra))
  end

  test "should show vmanodeobra" do
    get :show, id: @vmanodeobra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vmanodeobra
    assert_response :success
  end

  test "should update vmanodeobra" do
    put :update, id: @vmanodeobra, vmanodeobra: { cantidad: @vmanodeobra.cantidad, nombre: @vmanodeobra.nombre, parcial: @vmanodeobra.parcial, precio_unitario: @vmanodeobra.precio_unitario, unidad: @vmanodeobra.unidad, valorizacione_id: @vmanodeobra.valorizacione_id }
    assert_redirected_to vmanodeobra_path(assigns(:vmanodeobra))
  end

  test "should destroy vmanodeobra" do
    assert_difference('Vmanodeobra.count', -1) do
      delete :destroy, id: @vmanodeobra
    end

    assert_redirected_to vmanodeobras_path
  end
end
