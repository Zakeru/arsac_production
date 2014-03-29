require 'test_helper'

class ValesdeconsumosControllerTest < ActionController::TestCase
  setup do
    @valesdeconsumo = valesdeconsumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valesdeconsumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valesdeconsumo" do
    assert_difference('Valesdeconsumo.count') do
      post :create, valesdeconsumo: { cantidad: @valesdeconsumo.cantidad, numero_vale: @valesdeconsumo.numero_vale, proveedor: @valesdeconsumo.proveedor, tipo_material: @valesdeconsumo.tipo_material, tipo_vale: @valesdeconsumo.tipo_vale }
    end

    assert_redirected_to valesdeconsumo_path(assigns(:valesdeconsumo))
  end

  test "should show valesdeconsumo" do
    get :show, id: @valesdeconsumo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valesdeconsumo
    assert_response :success
  end

  test "should update valesdeconsumo" do
    put :update, id: @valesdeconsumo, valesdeconsumo: { cantidad: @valesdeconsumo.cantidad, numero_vale: @valesdeconsumo.numero_vale, proveedor: @valesdeconsumo.proveedor, tipo_material: @valesdeconsumo.tipo_material, tipo_vale: @valesdeconsumo.tipo_vale }
    assert_redirected_to valesdeconsumo_path(assigns(:valesdeconsumo))
  end

  test "should destroy valesdeconsumo" do
    assert_difference('Valesdeconsumo.count', -1) do
      delete :destroy, id: @valesdeconsumo
    end

    assert_redirected_to valesdeconsumos_path
  end
end
