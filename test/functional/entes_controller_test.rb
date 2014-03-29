require 'test_helper'

class EntesControllerTest < ActionController::TestCase
  setup do
    @ente = entes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ente" do
    assert_difference('Ente.count') do
      post :create, ente: { apellido: @ente.apellido, banco_1: @ente.banco_1, banco_2: @ente.banco_2, banco_3: @ente.banco_3, cci_1: @ente.cci_1, cci_2: @ente.cci_2, cci_3: @ente.cci_3, contacto: @ente.contacto, cuenta_corriente_1: @ente.cuenta_corriente_1, cuenta_corriente_2: @ente.cuenta_corriente_2, cuenta_corriente_3: @ente.cuenta_corriente_3, cuenta_detraccion: @ente.cuenta_detraccion, direccion: @ente.direccion, dni: @ente.dni, movil_1: @ente.movil_1, movil_2: @ente.movil_2, nombre: @ente.nombre, razon_social: @ente.razon_social, ruc: @ente.ruc, telefono: @ente.telefono }
    end

    assert_redirected_to ente_path(assigns(:ente))
  end

  test "should show ente" do
    get :show, id: @ente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ente
    assert_response :success
  end

  test "should update ente" do
    put :update, id: @ente, ente: { apellido: @ente.apellido, banco_1: @ente.banco_1, banco_2: @ente.banco_2, banco_3: @ente.banco_3, cci_1: @ente.cci_1, cci_2: @ente.cci_2, cci_3: @ente.cci_3, contacto: @ente.contacto, cuenta_corriente_1: @ente.cuenta_corriente_1, cuenta_corriente_2: @ente.cuenta_corriente_2, cuenta_corriente_3: @ente.cuenta_corriente_3, cuenta_detraccion: @ente.cuenta_detraccion, direccion: @ente.direccion, dni: @ente.dni, movil_1: @ente.movil_1, movil_2: @ente.movil_2, nombre: @ente.nombre, razon_social: @ente.razon_social, ruc: @ente.ruc, telefono: @ente.telefono }
    assert_redirected_to ente_path(assigns(:ente))
  end

  test "should destroy ente" do
    assert_difference('Ente.count', -1) do
      delete :destroy, id: @ente
    end

    assert_redirected_to entes_path
  end
end
