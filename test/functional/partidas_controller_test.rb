require 'test_helper'

class PartidasControllerTest < ActionController::TestCase
  setup do
    @partida = partidas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partidas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partida" do
    assert_difference('Partida.count') do
      post :create, partida: { diametro: @partida.diametro, metrado: @partida.metrado, nombre: @partida.nombre, observacion: @partida.observacion, parteobra_id: @partida.parteobra_id, profundidad: @partida.profundidad, serieclase: @partida.serieclase, unidad: @partida.unidad }
    end

    assert_redirected_to partida_path(assigns(:partida))
  end

  test "should show partida" do
    get :show, id: @partida
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partida
    assert_response :success
  end

  test "should update partida" do
    put :update, id: @partida, partida: { diametro: @partida.diametro, metrado: @partida.metrado, nombre: @partida.nombre, observacion: @partida.observacion, parteobra_id: @partida.parteobra_id, profundidad: @partida.profundidad, serieclase: @partida.serieclase, unidad: @partida.unidad }
    assert_redirected_to partida_path(assigns(:partida))
  end

  test "should destroy partida" do
    assert_difference('Partida.count', -1) do
      delete :destroy, id: @partida
    end

    assert_redirected_to partidas_path
  end
end
