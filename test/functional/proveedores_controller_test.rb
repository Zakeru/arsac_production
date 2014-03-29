require 'test_helper'

class ProveedoresControllerTest < ActionController::TestCase
  setup do
    @proveedore = proveedores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proveedores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proveedore" do
    assert_difference('Proveedore.count') do
      post :create, proveedore: { adelanto: @proveedore.adelanto, adelanto_detalle: @proveedore.adelanto_detalle, banco_1: @proveedore.banco_1, banco_2: @proveedore.banco_2, banco_3: @proveedore.banco_3, cci_1: @proveedore.cci_1, cci_2: @proveedore.cci_2, cci_3: @proveedore.cci_3, condiciones_de_pago: @proveedore.condiciones_de_pago, contacto: @proveedore.contacto, cuenta_corriente_1: @proveedore.cuenta_corriente_1, cuenta_corriente_2: @proveedore.cuenta_corriente_2, cuenta_corriente_3: @proveedore.cuenta_corriente_3, cuenta_de_detraccion: @proveedore.cuenta_de_detraccion, direccion: @proveedore.direccion, fondo_de_garantia: @proveedore.fondo_de_garantia, igv: @proveedore.igv, movil_1: @proveedore.movil_1, movil_2: @proveedore.movil_2, razon_social: @proveedore.razon_social, ruc: @proveedore.ruc, subcontratista: @proveedore.subcontratista, telefono: @proveedore.telefono, valorizaciones: @proveedore.valorizaciones }
    end

    assert_redirected_to proveedore_path(assigns(:proveedore))
  end

  test "should show proveedore" do
    get :show, id: @proveedore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proveedore
    assert_response :success
  end

  test "should update proveedore" do
    put :update, id: @proveedore, proveedore: { adelanto: @proveedore.adelanto, adelanto_detalle: @proveedore.adelanto_detalle, banco_1: @proveedore.banco_1, banco_2: @proveedore.banco_2, banco_3: @proveedore.banco_3, cci_1: @proveedore.cci_1, cci_2: @proveedore.cci_2, cci_3: @proveedore.cci_3, condiciones_de_pago: @proveedore.condiciones_de_pago, contacto: @proveedore.contacto, cuenta_corriente_1: @proveedore.cuenta_corriente_1, cuenta_corriente_2: @proveedore.cuenta_corriente_2, cuenta_corriente_3: @proveedore.cuenta_corriente_3, cuenta_de_detraccion: @proveedore.cuenta_de_detraccion, direccion: @proveedore.direccion, fondo_de_garantia: @proveedore.fondo_de_garantia, igv: @proveedore.igv, movil_1: @proveedore.movil_1, movil_2: @proveedore.movil_2, razon_social: @proveedore.razon_social, ruc: @proveedore.ruc, subcontratista: @proveedore.subcontratista, telefono: @proveedore.telefono, valorizaciones: @proveedore.valorizaciones }
    assert_redirected_to proveedore_path(assigns(:proveedore))
  end

  test "should destroy proveedore" do
    assert_difference('Proveedore.count', -1) do
      delete :destroy, id: @proveedore
    end

    assert_redirected_to proveedores_path
  end
end
