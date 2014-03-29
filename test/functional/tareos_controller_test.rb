require 'test_helper'

class TareosControllerTest < ActionController::TestCase
  setup do
    @tareo = tareos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tareo" do
    assert_difference('Tareo.count') do
      post :create, tareo: { nombre: @tareo.nombre }
    end

    assert_redirected_to tareo_path(assigns(:tareo))
  end

  test "should show tareo" do
    get :show, id: @tareo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tareo
    assert_response :success
  end

  test "should update tareo" do
    put :update, id: @tareo, tareo: { nombre: @tareo.nombre }
    assert_redirected_to tareo_path(assigns(:tareo))
  end

  test "should destroy tareo" do
    assert_difference('Tareo.count', -1) do
      delete :destroy, id: @tareo
    end

    assert_redirected_to tareos_path
  end
end
