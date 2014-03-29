require 'test_helper'

class InsumosControllerTest < ActionController::TestCase
  setup do
    @insumo = insumos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insumos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insumo" do
    assert_difference('Insumo.count') do
      post :create, insumo: { cantidad: @insumo.cantidad, catalogodeinsumo_id: @insumo.catalogodeinsumo_id, descripcion: @insumo.descripcion, parcial: @insumo.parcial, proveedore_id: @insumo.proveedore_id, pu_sin_igv: @insumo.pu_sin_igv, unidad: @insumo.unidad }
    end

    assert_redirected_to insumo_path(assigns(:insumo))
  end

  test "should show insumo" do
    get :show, id: @insumo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insumo
    assert_response :success
  end

  test "should update insumo" do
    put :update, id: @insumo, insumo: { cantidad: @insumo.cantidad, catalogodeinsumo_id: @insumo.catalogodeinsumo_id, descripcion: @insumo.descripcion, parcial: @insumo.parcial, proveedore_id: @insumo.proveedore_id, pu_sin_igv: @insumo.pu_sin_igv, unidad: @insumo.unidad }
    assert_redirected_to insumo_path(assigns(:insumo))
  end

  test "should destroy insumo" do
    assert_difference('Insumo.count', -1) do
      delete :destroy, id: @insumo
    end

    assert_redirected_to insumos_path
  end
end
