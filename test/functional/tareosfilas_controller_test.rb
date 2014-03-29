require 'test_helper'

class TareosfilasControllerTest < ActionController::TestCase
  setup do
    @tareosfila = tareosfilas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareosfilas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tareosfila" do
    assert_difference('Tareosfila.count') do
      post :create, tareosfila: { item: @tareosfila.item, tareoscolumna_id: @tareosfila.tareoscolumna_id }
    end

    assert_redirected_to tareosfila_path(assigns(:tareosfila))
  end

  test "should show tareosfila" do
    get :show, id: @tareosfila
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tareosfila
    assert_response :success
  end

  test "should update tareosfila" do
    put :update, id: @tareosfila, tareosfila: { item: @tareosfila.item, tareoscolumna_id: @tareosfila.tareoscolumna_id }
    assert_redirected_to tareosfila_path(assigns(:tareosfila))
  end

  test "should destroy tareosfila" do
    assert_difference('Tareosfila.count', -1) do
      delete :destroy, id: @tareosfila
    end

    assert_redirected_to tareosfilas_path
  end
end
