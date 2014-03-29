require 'test_helper'

class JefedefrentesControllerTest < ActionController::TestCase
  setup do
    @jefedefrente = jefedefrentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jefedefrentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jefedefrente" do
    assert_difference('Jefedefrente.count') do
      post :create, jefedefrente: { descripcion: @jefedefrente.descripcion, frente_id: @jefedefrente.frente_id, nombre: @jefedefrente.nombre }
    end

    assert_redirected_to jefedefrente_path(assigns(:jefedefrente))
  end

  test "should show jefedefrente" do
    get :show, id: @jefedefrente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jefedefrente
    assert_response :success
  end

  test "should update jefedefrente" do
    put :update, id: @jefedefrente, jefedefrente: { descripcion: @jefedefrente.descripcion, frente_id: @jefedefrente.frente_id, nombre: @jefedefrente.nombre }
    assert_redirected_to jefedefrente_path(assigns(:jefedefrente))
  end

  test "should destroy jefedefrente" do
    assert_difference('Jefedefrente.count', -1) do
      delete :destroy, id: @jefedefrente
    end

    assert_redirected_to jefedefrentes_path
  end
end
