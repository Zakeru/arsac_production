require 'test_helper'

class CatalogocategoriatrabajadoresControllerTest < ActionController::TestCase
  setup do
    @catalogocategoriatrabajadore = catalogocategoriatrabajadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catalogocategoriatrabajadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catalogocategoriatrabajadore" do
    assert_difference('Catalogocategoriatrabajadore.count') do
      post :create, catalogocategoriatrabajadore: { nombre: @catalogocategoriatrabajadore.nombre }
    end

    assert_redirected_to catalogocategoriatrabajadore_path(assigns(:catalogocategoriatrabajadore))
  end

  test "should show catalogocategoriatrabajadore" do
    get :show, id: @catalogocategoriatrabajadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catalogocategoriatrabajadore
    assert_response :success
  end

  test "should update catalogocategoriatrabajadore" do
    put :update, id: @catalogocategoriatrabajadore, catalogocategoriatrabajadore: { nombre: @catalogocategoriatrabajadore.nombre }
    assert_redirected_to catalogocategoriatrabajadore_path(assigns(:catalogocategoriatrabajadore))
  end

  test "should destroy catalogocategoriatrabajadore" do
    assert_difference('Catalogocategoriatrabajadore.count', -1) do
      delete :destroy, id: @catalogocategoriatrabajadore
    end

    assert_redirected_to catalogocategoriatrabajadores_path
  end
end
