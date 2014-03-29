require 'test_helper'

class FrentesControllerTest < ActionController::TestCase
  setup do
    @frente = frentes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frentes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frente" do
    assert_difference('Frente.count') do
      post :create, frente: { descripcion: @frente.descripcion, nombre: @frente.nombre }
    end

    assert_redirected_to frente_path(assigns(:frente))
  end

  test "should show frente" do
    get :show, id: @frente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frente
    assert_response :success
  end

  test "should update frente" do
    put :update, id: @frente, frente: { descripcion: @frente.descripcion, nombre: @frente.nombre }
    assert_redirected_to frente_path(assigns(:frente))
  end

  test "should destroy frente" do
    assert_difference('Frente.count', -1) do
      delete :destroy, id: @frente
    end

    assert_redirected_to frentes_path
  end
end
