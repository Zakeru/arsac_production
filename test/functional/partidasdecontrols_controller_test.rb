require 'test_helper'

class PartidasdecontrolsControllerTest < ActionController::TestCase
  setup do
    @partidasdecontrol = partidasdecontrols(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partidasdecontrols)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partidasdecontrol" do
    assert_difference('Partidasdecontrol.count') do
      post :create, partidasdecontrol: { subfase_id: @partidasdecontrol.subfase_id, subsectore_id: @partidasdecontrol.subsectore_id }
    end

    assert_redirected_to partidasdecontrol_path(assigns(:partidasdecontrol))
  end

  test "should show partidasdecontrol" do
    get :show, id: @partidasdecontrol
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partidasdecontrol
    assert_response :success
  end

  test "should update partidasdecontrol" do
    put :update, id: @partidasdecontrol, partidasdecontrol: { subfase_id: @partidasdecontrol.subfase_id, subsectore_id: @partidasdecontrol.subsectore_id }
    assert_redirected_to partidasdecontrol_path(assigns(:partidasdecontrol))
  end

  test "should destroy partidasdecontrol" do
    assert_difference('Partidasdecontrol.count', -1) do
      delete :destroy, id: @partidasdecontrol
    end

    assert_redirected_to partidasdecontrols_path
  end
end
