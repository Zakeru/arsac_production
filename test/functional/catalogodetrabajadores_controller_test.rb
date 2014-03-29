require 'test_helper'

class CatalogodetrabajadoresControllerTest < ActionController::TestCase
  setup do
    @catalogodetrabajadore = catalogodetrabajadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalogodetrabajadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalogodetrabajadore" do
    assert_difference('Catalogodetrabajadore.count') do
      post :create, catalogodetrabajadore: { apellido: @catalogodetrabajadore.apellido, dni: @catalogodetrabajadore.dni, nombre: @catalogodetrabajadore.nombre }
    end

    assert_redirected_to catalogodetrabajadore_path(assigns(:catalogodetrabajadore))
  end

  test "should show catalogodetrabajadore" do
    get :show, id: @catalogodetrabajadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalogodetrabajadore
    assert_response :success
  end

  test "should update catalogodetrabajadore" do
    put :update, id: @catalogodetrabajadore, catalogodetrabajadore: { apellido: @catalogodetrabajadore.apellido, dni: @catalogodetrabajadore.dni, nombre: @catalogodetrabajadore.nombre }
    assert_redirected_to catalogodetrabajadore_path(assigns(:catalogodetrabajadore))
  end

  test "should destroy catalogodetrabajadore" do
    assert_difference('Catalogodetrabajadore.count', -1) do
      delete :destroy, id: @catalogodetrabajadore
    end

    assert_redirected_to catalogodetrabajadores_path
  end
end
