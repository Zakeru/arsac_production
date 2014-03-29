require 'test_helper'

class GruposdetrabajosControllerTest < ActionController::TestCase
  setup do
    @gruposdetrabajo = gruposdetrabajos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gruposdetrabajos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gruposdetrabajo" do
    assert_difference('Gruposdetrabajo.count') do
      post :create, gruposdetrabajo: { jefedefrente_id: @gruposdetrabajo.jefedefrente_id, maestrodeobra_id: @gruposdetrabajo.maestrodeobra_id, proveedore_id: @gruposdetrabajo.proveedore_id, sectore_id: @gruposdetrabajo.sectore_id, subsectore_id: @gruposdetrabajo.subsectore_id }
    end

    assert_redirected_to gruposdetrabajo_path(assigns(:gruposdetrabajo))
  end

  test "should show gruposdetrabajo" do
    get :show, id: @gruposdetrabajo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gruposdetrabajo
    assert_response :success
  end

  test "should update gruposdetrabajo" do
    put :update, id: @gruposdetrabajo, gruposdetrabajo: { jefedefrente_id: @gruposdetrabajo.jefedefrente_id, maestrodeobra_id: @gruposdetrabajo.maestrodeobra_id, proveedore_id: @gruposdetrabajo.proveedore_id, sectore_id: @gruposdetrabajo.sectore_id, subsectore_id: @gruposdetrabajo.subsectore_id }
    assert_redirected_to gruposdetrabajo_path(assigns(:gruposdetrabajo))
  end

  test "should destroy gruposdetrabajo" do
    assert_difference('Gruposdetrabajo.count', -1) do
      delete :destroy, id: @gruposdetrabajo
    end

    assert_redirected_to gruposdetrabajos_path
  end
end
