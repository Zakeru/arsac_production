require 'test_helper'

class ImportalistasControllerTest < ActionController::TestCase
  setup do
    @importalista = importalistas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:importalistas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create importalista" do
    assert_difference('Importalista.count') do
      post :create, importalista: { nombre: @importalista.nombre }
    end

    assert_redirected_to importalista_path(assigns(:importalista))
  end

  test "should show importalista" do
    get :show, id: @importalista
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @importalista
    assert_response :success
  end

  test "should update importalista" do
    put :update, id: @importalista, importalista: { nombre: @importalista.nombre }
    assert_redirected_to importalista_path(assigns(:importalista))
  end

  test "should destroy importalista" do
    assert_difference('Importalista.count', -1) do
      delete :destroy, id: @importalista
    end

    assert_redirected_to importalistas_path
  end
end
