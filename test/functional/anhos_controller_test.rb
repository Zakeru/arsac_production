require 'test_helper'

class AnhosControllerTest < ActionController::TestCase
  setup do
    @anho = anhos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anhos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anho" do
    assert_difference('Anho.count') do
      post :create, anho: { nombre: @anho.nombre }
    end

    assert_redirected_to anho_path(assigns(:anho))
  end

  test "should show anho" do
    get :show, id: @anho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anho
    assert_response :success
  end

  test "should update anho" do
    put :update, id: @anho, anho: { nombre: @anho.nombre }
    assert_redirected_to anho_path(assigns(:anho))
  end

  test "should destroy anho" do
    assert_difference('Anho.count', -1) do
      delete :destroy, id: @anho
    end

    assert_redirected_to anhos_path
  end
end
