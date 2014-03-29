require 'test_helper'

class CombustibletiposControllerTest < ActionController::TestCase
  setup do
    @combustibletipo = combustibletipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:combustibletipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create combustibletipo" do
    assert_difference('Combustibletipo.count') do
      post :create, combustibletipo: { combustible: @combustibletipo.combustible, tipo: @combustibletipo.tipo }
    end

    assert_redirected_to combustibletipo_path(assigns(:combustibletipo))
  end

  test "should show combustibletipo" do
    get :show, id: @combustibletipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @combustibletipo
    assert_response :success
  end

  test "should update combustibletipo" do
    put :update, id: @combustibletipo, combustibletipo: { combustible: @combustibletipo.combustible, tipo: @combustibletipo.tipo }
    assert_redirected_to combustibletipo_path(assigns(:combustibletipo))
  end

  test "should destroy combustibletipo" do
    assert_difference('Combustibletipo.count', -1) do
      delete :destroy, id: @combustibletipo
    end

    assert_redirected_to combustibletipos_path
  end
end
