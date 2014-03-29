require 'test_helper'

class VequiposControllerTest < ActionController::TestCase
  setup do
    @vequipo = vequipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vequipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vequipo" do
    assert_difference('Vequipo.count') do
      post :create, vequipo: { cantidad: @vequipo.cantidad, nombre: @vequipo.nombre, parcial: @vequipo.parcial, precio_unitario: @vequipo.precio_unitario, unidad: @vequipo.unidad, valorizacione_id: @vequipo.valorizacione_id }
    end

    assert_redirected_to vequipo_path(assigns(:vequipo))
  end

  test "should show vequipo" do
    get :show, id: @vequipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vequipo
    assert_response :success
  end

  test "should update vequipo" do
    put :update, id: @vequipo, vequipo: { cantidad: @vequipo.cantidad, nombre: @vequipo.nombre, parcial: @vequipo.parcial, precio_unitario: @vequipo.precio_unitario, unidad: @vequipo.unidad, valorizacione_id: @vequipo.valorizacione_id }
    assert_redirected_to vequipo_path(assigns(:vequipo))
  end

  test "should destroy vequipo" do
    assert_difference('Vequipo.count', -1) do
      delete :destroy, id: @vequipo
    end

    assert_redirected_to vequipos_path
  end
end
