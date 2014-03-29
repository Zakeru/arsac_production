require 'test_helper'

class InsumodeequiposControllerTest < ActionController::TestCase
  setup do
    @insumodeequipo = insumodeequipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insumodeequipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create insumodeequipo" do
    assert_difference('Insumodeequipo.count') do
      post :create, insumodeequipo: { cantidad: @insumodeequipo.cantidad, codigo_tobi: @insumodeequipo.codigo_tobi, nombre: @insumodeequipo.nombre, precio: @insumodeequipo.precio, unidade_id: @insumodeequipo.unidade_id }
    end

    assert_redirected_to insumodeequipo_path(assigns(:insumodeequipo))
  end

  test "should show insumodeequipo" do
    get :show, id: @insumodeequipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @insumodeequipo
    assert_response :success
  end

  test "should update insumodeequipo" do
    put :update, id: @insumodeequipo, insumodeequipo: { cantidad: @insumodeequipo.cantidad, codigo_tobi: @insumodeequipo.codigo_tobi, nombre: @insumodeequipo.nombre, precio: @insumodeequipo.precio, unidade_id: @insumodeequipo.unidade_id }
    assert_redirected_to insumodeequipo_path(assigns(:insumodeequipo))
  end

  test "should destroy insumodeequipo" do
    assert_difference('Insumodeequipo.count', -1) do
      delete :destroy, id: @insumodeequipo
    end

    assert_redirected_to insumodeequipos_path
  end
end
