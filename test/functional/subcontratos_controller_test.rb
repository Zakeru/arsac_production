require 'test_helper'

class SubcontratosControllerTest < ActionController::TestCase
  setup do
    @subcontrato = subcontratos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subcontratos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subcontrato" do
    assert_difference('Subcontrato.count') do
      post :create, subcontrato: { adelanto: @subcontrato.adelanto, adelanto_detalle: @subcontrato.adelanto_detalle, condiciones_de_pago: @subcontrato.condiciones_de_pago, fondo_de_garantia: @subcontrato.fondo_de_garantia, igv: @subcontrato.igv, valorizacion: @subcontrato.valorizacion }
    end

    assert_redirected_to subcontrato_path(assigns(:subcontrato))
  end

  test "should show subcontrato" do
    get :show, id: @subcontrato
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subcontrato
    assert_response :success
  end

  test "should update subcontrato" do
    put :update, id: @subcontrato, subcontrato: { adelanto: @subcontrato.adelanto, adelanto_detalle: @subcontrato.adelanto_detalle, condiciones_de_pago: @subcontrato.condiciones_de_pago, fondo_de_garantia: @subcontrato.fondo_de_garantia, igv: @subcontrato.igv, valorizacion: @subcontrato.valorizacion }
    assert_redirected_to subcontrato_path(assigns(:subcontrato))
  end

  test "should destroy subcontrato" do
    assert_difference('Subcontrato.count', -1) do
      delete :destroy, id: @subcontrato
    end

    assert_redirected_to subcontratos_path
  end
end
