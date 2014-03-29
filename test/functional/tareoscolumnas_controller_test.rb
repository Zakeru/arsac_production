require 'test_helper'

class TareoscolumnasControllerTest < ActionController::TestCase
  setup do
    @tareoscolumna = tareoscolumnas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tareoscolumnas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tareoscolumna" do
    assert_difference('Tareoscolumna.count') do
      post :create, tareoscolumna: { item: @tareoscolumna.item, tareosgruposdetrabajo_id: @tareoscolumna.tareosgruposdetrabajo_id }
    end

    assert_redirected_to tareoscolumna_path(assigns(:tareoscolumna))
  end

  test "should show tareoscolumna" do
    get :show, id: @tareoscolumna
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tareoscolumna
    assert_response :success
  end

  test "should update tareoscolumna" do
    put :update, id: @tareoscolumna, tareoscolumna: { item: @tareoscolumna.item, tareosgruposdetrabajo_id: @tareoscolumna.tareosgruposdetrabajo_id }
    assert_redirected_to tareoscolumna_path(assigns(:tareoscolumna))
  end

  test "should destroy tareoscolumna" do
    assert_difference('Tareoscolumna.count', -1) do
      delete :destroy, id: @tareoscolumna
    end

    assert_redirected_to tareoscolumnas_path
  end
end
