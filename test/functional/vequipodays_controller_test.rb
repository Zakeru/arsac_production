require 'test_helper'

class VequipodaysControllerTest < ActionController::TestCase
  setup do
    @vequipoday = vequipodays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vequipodays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vequipoday" do
    assert_difference('Vequipoday.count') do
      post :create, vequipoday: { combustible: @vequipoday.combustible, fecha: @vequipoday.fecha, hora_fin: @vequipoday.hora_fin, hora_inicio: @vequipoday.hora_inicio, horas_efectivas: @vequipoday.horas_efectivas, horas_horas: @vequipoday.horas_horas, numero_parte: @vequipoday.numero_parte, suministro: @vequipoday.suministro }
    end

    assert_redirected_to vequipoday_path(assigns(:vequipoday))
  end

  test "should show vequipoday" do
    get :show, id: @vequipoday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vequipoday
    assert_response :success
  end

  test "should update vequipoday" do
    put :update, id: @vequipoday, vequipoday: { combustible: @vequipoday.combustible, fecha: @vequipoday.fecha, hora_fin: @vequipoday.hora_fin, hora_inicio: @vequipoday.hora_inicio, horas_efectivas: @vequipoday.horas_efectivas, horas_horas: @vequipoday.horas_horas, numero_parte: @vequipoday.numero_parte, suministro: @vequipoday.suministro }
    assert_redirected_to vequipoday_path(assigns(:vequipoday))
  end

  test "should destroy vequipoday" do
    assert_difference('Vequipoday.count', -1) do
      delete :destroy, id: @vequipoday
    end

    assert_redirected_to vequipodays_path
  end
end
