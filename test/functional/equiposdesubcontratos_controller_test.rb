require 'test_helper'

class EquiposdesubcontratosControllerTest < ActionController::TestCase
  setup do
    @equiposdesubcontrato = equiposdesubcontratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equiposdesubcontratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equiposdesubcontrato" do
    assert_difference('Equiposdesubcontrato.count') do
      post :create, equiposdesubcontrato: { anho: @equiposdesubcontrato.anho, cantidad_h_m: @equiposdesubcontrato.cantidad_h_m, codigo: @equiposdesubcontrato.codigo, descripcion: @equiposdesubcontrato.descripcion, horas_minimas: @equiposdesubcontrato.horas_minimas, incluye: @equiposdesubcontrato.incluye, insumos10_id: @equiposdesubcontrato.insumos10_id, marca: @equiposdesubcontrato.marca, modelo: @equiposdesubcontrato.modelo, precion_sin_igv: @equiposdesubcontrato.precion_sin_igv, serie: @equiposdesubcontrato.serie, subcontratodeequipo_id: @equiposdesubcontrato.subcontratodeequipo_id, und: @equiposdesubcontrato.und }
    end

    assert_redirected_to equiposdesubcontrato_path(assigns(:equiposdesubcontrato))
  end

  test "should show equiposdesubcontrato" do
    get :show, id: @equiposdesubcontrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equiposdesubcontrato
    assert_response :success
  end

  test "should update equiposdesubcontrato" do
    put :update, id: @equiposdesubcontrato, equiposdesubcontrato: { anho: @equiposdesubcontrato.anho, cantidad_h_m: @equiposdesubcontrato.cantidad_h_m, codigo: @equiposdesubcontrato.codigo, descripcion: @equiposdesubcontrato.descripcion, horas_minimas: @equiposdesubcontrato.horas_minimas, incluye: @equiposdesubcontrato.incluye, insumos10_id: @equiposdesubcontrato.insumos10_id, marca: @equiposdesubcontrato.marca, modelo: @equiposdesubcontrato.modelo, precion_sin_igv: @equiposdesubcontrato.precion_sin_igv, serie: @equiposdesubcontrato.serie, subcontratodeequipo_id: @equiposdesubcontrato.subcontratodeequipo_id, und: @equiposdesubcontrato.und }
    assert_redirected_to equiposdesubcontrato_path(assigns(:equiposdesubcontrato))
  end

  test "should destroy equiposdesubcontrato" do
    assert_difference('Equiposdesubcontrato.count', -1) do
      delete :destroy, id: @equiposdesubcontrato
    end

    assert_redirected_to equiposdesubcontratos_path
  end
end
