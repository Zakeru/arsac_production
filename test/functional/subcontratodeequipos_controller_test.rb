require 'test_helper'

class SubcontratodeequiposControllerTest < ActionController::TestCase
  setup do
    @subcontratodeequipo = subcontratodeequipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontratodeequipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontratodeequipo" do
    assert_difference('Subcontratodeequipo.count') do
      post :create, subcontratodeequipo: { adelanto: @subcontratodeequipo.adelanto, adelanto_detalle: @subcontratodeequipo.adelanto_detalle, condiciones_de_pago: @subcontratodeequipo.condiciones_de_pago, fondo_de_garantia: @subcontratodeequipo.fondo_de_garantia, igv: @subcontratodeequipo.igv, proveedor_id: @subcontratodeequipo.proveedor_id, valorizacion: @subcontratodeequipo.valorizacion }
    end

    assert_redirected_to subcontratodeequipo_path(assigns(:subcontratodeequipo))
  end

  test "should show subcontratodeequipo" do
    get :show, id: @subcontratodeequipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcontratodeequipo
    assert_response :success
  end

  test "should update subcontratodeequipo" do
    put :update, id: @subcontratodeequipo, subcontratodeequipo: { adelanto: @subcontratodeequipo.adelanto, adelanto_detalle: @subcontratodeequipo.adelanto_detalle, condiciones_de_pago: @subcontratodeequipo.condiciones_de_pago, fondo_de_garantia: @subcontratodeequipo.fondo_de_garantia, igv: @subcontratodeequipo.igv, proveedor_id: @subcontratodeequipo.proveedor_id, valorizacion: @subcontratodeequipo.valorizacion }
    assert_redirected_to subcontratodeequipo_path(assigns(:subcontratodeequipo))
  end

  test "should destroy subcontratodeequipo" do
    assert_difference('Subcontratodeequipo.count', -1) do
      delete :destroy, id: @subcontratodeequipo
    end

    assert_redirected_to subcontratodeequipos_path
  end
end
