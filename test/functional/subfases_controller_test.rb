require 'test_helper'

class SubfasesControllerTest < ActionController::TestCase
  setup do
    @subfase = subfases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subfases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subfase" do
    assert_difference('Subfase.count') do
      post :create, subfase: { codigo: @subfase.codigo, descripcion: @subfase.descripcion, fase_id: @subfase.fase_id }
    end

    assert_redirected_to subfase_path(assigns(:subfase))
  end

  test "should show subfase" do
    get :show, id: @subfase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subfase
    assert_response :success
  end

  test "should update subfase" do
    put :update, id: @subfase, subfase: { codigo: @subfase.codigo, descripcion: @subfase.descripcion, fase_id: @subfase.fase_id }
    assert_redirected_to subfase_path(assigns(:subfase))
  end

  test "should destroy subfase" do
    assert_difference('Subfase.count', -1) do
      delete :destroy, id: @subfase
    end

    assert_redirected_to subfases_path
  end
end
