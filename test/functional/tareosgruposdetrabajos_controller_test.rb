require 'test_helper'

class TareosgruposdetrabajosControllerTest < ActionController::TestCase
  setup do
    @tareosgruposdetrabajo = tareosgruposdetrabajos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareosgruposdetrabajos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tareosgruposdetrabajo" do
    assert_difference('Tareosgruposdetrabajo.count') do
      post :create, tareosgruposdetrabajo: { nombre: @tareosgruposdetrabajo.nombre, tareo_id: @tareosgruposdetrabajo.tareo_id }
    end

    assert_redirected_to tareosgruposdetrabajo_path(assigns(:tareosgruposdetrabajo))
  end

  test "should show tareosgruposdetrabajo" do
    get :show, id: @tareosgruposdetrabajo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tareosgruposdetrabajo
    assert_response :success
  end

  test "should update tareosgruposdetrabajo" do
    put :update, id: @tareosgruposdetrabajo, tareosgruposdetrabajo: { nombre: @tareosgruposdetrabajo.nombre, tareo_id: @tareosgruposdetrabajo.tareo_id }
    assert_redirected_to tareosgruposdetrabajo_path(assigns(:tareosgruposdetrabajo))
  end

  test "should destroy tareosgruposdetrabajo" do
    assert_difference('Tareosgruposdetrabajo.count', -1) do
      delete :destroy, id: @tareosgruposdetrabajo
    end

    assert_redirected_to tareosgruposdetrabajos_path
  end
end
