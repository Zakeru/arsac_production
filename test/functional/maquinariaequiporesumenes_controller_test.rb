require 'test_helper'

class MaquinariaequiporesumenesControllerTest < ActionController::TestCase
  setup do
    @maquinariaequiporesumene = maquinariaequiporesumenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maquinariaequiporesumenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maquinariaequiporesumene" do
    assert_difference('Maquinariaequiporesumene.count') do
      post :create, maquinariaequiporesumene: { combustible: @maquinariaequiporesumene.combustible, equipo: @maquinariaequiporesumene.equipo, fecha: @maquinariaequiporesumene.fecha, horas_efectivas: @maquinariaequiporesumene.horas_efectivas, horometro_horas: @maquinariaequiporesumene.horometro_horas, maquinariaequipo_id: @maquinariaequiporesumene.maquinariaequipo_id, numero: @maquinariaequiporesumene.numero }
    end

    assert_redirected_to maquinariaequiporesumene_path(assigns(:maquinariaequiporesumene))
  end

  test "should show maquinariaequiporesumene" do
    get :show, id: @maquinariaequiporesumene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maquinariaequiporesumene
    assert_response :success
  end

  test "should update maquinariaequiporesumene" do
    put :update, id: @maquinariaequiporesumene, maquinariaequiporesumene: { combustible: @maquinariaequiporesumene.combustible, equipo: @maquinariaequiporesumene.equipo, fecha: @maquinariaequiporesumene.fecha, horas_efectivas: @maquinariaequiporesumene.horas_efectivas, horometro_horas: @maquinariaequiporesumene.horometro_horas, maquinariaequipo_id: @maquinariaequiporesumene.maquinariaequipo_id, numero: @maquinariaequiporesumene.numero }
    assert_redirected_to maquinariaequiporesumene_path(assigns(:maquinariaequiporesumene))
  end

  test "should destroy maquinariaequiporesumene" do
    assert_difference('Maquinariaequiporesumene.count', -1) do
      delete :destroy, id: @maquinariaequiporesumene
    end

    assert_redirected_to maquinariaequiporesumenes_path
  end
end
