require 'test_helper'

class SemanasControllerTest < ActionController::TestCase
  setup do
    @semana = semanas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:semanas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create semana" do
    assert_difference('Semana.count') do
      post :create, semana: { numero: @semana.numero }
    end

    assert_redirected_to semana_path(assigns(:semana))
  end

  test "should show semana" do
    get :show, id: @semana
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @semana
    assert_response :success
  end

  test "should update semana" do
    put :update, id: @semana, semana: { numero: @semana.numero }
    assert_redirected_to semana_path(assigns(:semana))
  end

  test "should destroy semana" do
    assert_difference('Semana.count', -1) do
      delete :destroy, id: @semana
    end

    assert_redirected_to semanas_path
  end
end
