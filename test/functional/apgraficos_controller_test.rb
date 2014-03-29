require 'test_helper'

class ApgraficosControllerTest < ActionController::TestCase
  setup do
    @apgrafico = apgraficos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apgraficos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apgrafico" do
    assert_difference('Apgrafico.count') do
      post :create, apgrafico: { nombre: @apgrafico.nombre }
    end

    assert_redirected_to apgrafico_path(assigns(:apgrafico))
  end

  test "should show apgrafico" do
    get :show, id: @apgrafico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apgrafico
    assert_response :success
  end

  test "should update apgrafico" do
    put :update, id: @apgrafico, apgrafico: { nombre: @apgrafico.nombre }
    assert_redirected_to apgrafico_path(assigns(:apgrafico))
  end

  test "should destroy apgrafico" do
    assert_difference('Apgrafico.count', -1) do
      delete :destroy, id: @apgrafico
    end

    assert_redirected_to apgraficos_path
  end
end
