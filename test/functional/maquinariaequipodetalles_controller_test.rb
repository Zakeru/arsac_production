require 'test_helper'

class MaquinariaequipodetallesControllerTest < ActionController::TestCase
  setup do
    @maquinariaequipodetalle = maquinariaequipodetalles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maquinariaequipodetalles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maquinariaequipodetalle" do
    assert_difference('Maquinariaequipodetalle.count') do
      post :create, maquinariaequipodetalle: { combustible: @maquinariaequipodetalle.combustible, fecha: @maquinariaequipodetalle.fecha, horas_efectivas: @maquinariaequipodetalle.horas_efectivas, horometro_fin: @maquinariaequipodetalle.horometro_fin, horometro_horas: @maquinariaequipodetalle.horometro_horas, horometro_inicio: @maquinariaequipodetalle.horometro_inicio, maquinariaequipo_id: @maquinariaequipodetalle.maquinariaequipo_id, numero: @maquinariaequipodetalle.numero, parte: @maquinariaequipodetalle.parte, suministro: @maquinariaequipodetalle.suministro }
    end

    assert_redirected_to maquinariaequipodetalle_path(assigns(:maquinariaequipodetalle))
  end

  test "should show maquinariaequipodetalle" do
    get :show, id: @maquinariaequipodetalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maquinariaequipodetalle
    assert_response :success
  end

  test "should update maquinariaequipodetalle" do
    put :update, id: @maquinariaequipodetalle, maquinariaequipodetalle: { combustible: @maquinariaequipodetalle.combustible, fecha: @maquinariaequipodetalle.fecha, horas_efectivas: @maquinariaequipodetalle.horas_efectivas, horometro_fin: @maquinariaequipodetalle.horometro_fin, horometro_horas: @maquinariaequipodetalle.horometro_horas, horometro_inicio: @maquinariaequipodetalle.horometro_inicio, maquinariaequipo_id: @maquinariaequipodetalle.maquinariaequipo_id, numero: @maquinariaequipodetalle.numero, parte: @maquinariaequipodetalle.parte, suministro: @maquinariaequipodetalle.suministro }
    assert_redirected_to maquinariaequipodetalle_path(assigns(:maquinariaequipodetalle))
  end

  test "should destroy maquinariaequipodetalle" do
    assert_difference('Maquinariaequipodetalle.count', -1) do
      delete :destroy, id: @maquinariaequipodetalle
    end

    assert_redirected_to maquinariaequipodetalles_path
  end
end
