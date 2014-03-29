require 'test_helper'

class ListacategoriasControllerTest < ActionController::TestCase
  setup do
    @listacategoria = listacategorias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listacategorias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listacategoria" do
    assert_difference('Listacategoria.count') do
      post :create, listacategoria: { lista_id: @listacategoria.lista_id, nombre: @listacategoria.nombre }
    end

    assert_redirected_to listacategoria_path(assigns(:listacategoria))
  end

  test "should show listacategoria" do
    get :show, id: @listacategoria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listacategoria
    assert_response :success
  end

  test "should update listacategoria" do
    put :update, id: @listacategoria, listacategoria: { lista_id: @listacategoria.lista_id, nombre: @listacategoria.nombre }
    assert_redirected_to listacategoria_path(assigns(:listacategoria))
  end

  test "should destroy listacategoria" do
    assert_difference('Listacategoria.count', -1) do
      delete :destroy, id: @listacategoria
    end

    assert_redirected_to listacategorias_path
  end
end
