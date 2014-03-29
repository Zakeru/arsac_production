require 'test_helper'

class SubsectoresControllerTest < ActionController::TestCase
  setup do
    @subsectore = subsectores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subsectores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subsectore" do
    assert_difference('Subsectore.count') do
      post :create, subsectore: { codigo: @subsectore.codigo, descripcion: @subsectore.descripcion, sectore_id: @subsectore.sectore_id }
    end

    assert_redirected_to subsectore_path(assigns(:subsectore))
  end

  test "should show subsectore" do
    get :show, id: @subsectore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subsectore
    assert_response :success
  end

  test "should update subsectore" do
    put :update, id: @subsectore, subsectore: { codigo: @subsectore.codigo, descripcion: @subsectore.descripcion, sectore_id: @subsectore.sectore_id }
    assert_redirected_to subsectore_path(assigns(:subsectore))
  end

  test "should destroy subsectore" do
    assert_difference('Subsectore.count', -1) do
      delete :destroy, id: @subsectore
    end

    assert_redirected_to subsectores_path
  end
end
