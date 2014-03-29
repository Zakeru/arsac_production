require 'test_helper'

class ValorizacionesControllerTest < ActionController::TestCase
  setup do
    @valorizacione = valorizaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:valorizaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create valorizacione" do
    assert_difference('Valorizacione.count') do
      post :create, valorizacione: { fecha_1: @valorizacione.fecha_1, fecha_2: @valorizacione.fecha_2, frente_id: @valorizacione.frente_id, subcontrato_id: @valorizacione.subcontrato_id }
    end

    assert_redirected_to valorizacione_path(assigns(:valorizacione))
  end

  test "should show valorizacione" do
    get :show, id: @valorizacione
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @valorizacione
    assert_response :success
  end

  test "should update valorizacione" do
    put :update, id: @valorizacione, valorizacione: { fecha_1: @valorizacione.fecha_1, fecha_2: @valorizacione.fecha_2, frente_id: @valorizacione.frente_id, subcontrato_id: @valorizacione.subcontrato_id }
    assert_redirected_to valorizacione_path(assigns(:valorizacione))
  end

  test "should destroy valorizacione" do
    assert_difference('Valorizacione.count', -1) do
      delete :destroy, id: @valorizacione
    end

    assert_redirected_to valorizaciones_path
  end
end
