require 'test_helper'

class EquipoincluyesControllerTest < ActionController::TestCase
  setup do
    @equipoincluye = equipoincluyes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipoincluyes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipoincluye" do
    assert_difference('Equipoincluye.count') do
      post :create, equipoincluye: { nombre: @equipoincluye.nombre }
    end

    assert_redirected_to equipoincluye_path(assigns(:equipoincluye))
  end

  test "should show equipoincluye" do
    get :show, id: @equipoincluye
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipoincluye
    assert_response :success
  end

  test "should update equipoincluye" do
    put :update, id: @equipoincluye, equipoincluye: { nombre: @equipoincluye.nombre }
    assert_redirected_to equipoincluye_path(assigns(:equipoincluye))
  end

  test "should destroy equipoincluye" do
    assert_difference('Equipoincluye.count', -1) do
      delete :destroy, id: @equipoincluye
    end

    assert_redirected_to equipoincluyes_path
  end
end
