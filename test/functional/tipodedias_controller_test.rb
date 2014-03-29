require 'test_helper'

class TipodediasControllerTest < ActionController::TestCase
  setup do
    @tipodedia = tipodedias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipodedias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipodedia" do
    assert_difference('Tipodedia.count') do
      post :create, tipodedia: { nombre: @tipodedia.nombre }
    end

    assert_redirected_to tipodedia_path(assigns(:tipodedia))
  end

  test "should show tipodedia" do
    get :show, id: @tipodedia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipodedia
    assert_response :success
  end

  test "should update tipodedia" do
    put :update, id: @tipodedia, tipodedia: { nombre: @tipodedia.nombre }
    assert_redirected_to tipodedia_path(assigns(:tipodedia))
  end

  test "should destroy tipodedia" do
    assert_difference('Tipodedia.count', -1) do
      delete :destroy, id: @tipodedia
    end

    assert_redirected_to tipodedias_path
  end
end
