require 'test_helper'

class TrabajadoresControllerTest < ActionController::TestCase
  setup do
    @trabajadore = trabajadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trabajadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trabajadore" do
    assert_difference('Trabajadore.count') do
      post :create, trabajadore: { catalogocategoriatrabajadore_id: @trabajadore.catalogocategoriatrabajadore_id, catalogodetrabajadore_id: @trabajadore.catalogodetrabajadore_id, normal: @trabajadore.normal, normal_100: @trabajadore.normal_100, normal_60: @trabajadore.normal_60, partediariodepersonal_id: @trabajadore.partediariodepersonal_id, partidasdecontrol_id: @trabajadore.partidasdecontrol_id, total_horas: @trabajadore.total_horas }
    end

    assert_redirected_to trabajadore_path(assigns(:trabajadore))
  end

  test "should show trabajadore" do
    get :show, id: @trabajadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trabajadore
    assert_response :success
  end

  test "should update trabajadore" do
    put :update, id: @trabajadore, trabajadore: { catalogocategoriatrabajadore_id: @trabajadore.catalogocategoriatrabajadore_id, catalogodetrabajadore_id: @trabajadore.catalogodetrabajadore_id, normal: @trabajadore.normal, normal_100: @trabajadore.normal_100, normal_60: @trabajadore.normal_60, partediariodepersonal_id: @trabajadore.partediariodepersonal_id, partidasdecontrol_id: @trabajadore.partidasdecontrol_id, total_horas: @trabajadore.total_horas }
    assert_redirected_to trabajadore_path(assigns(:trabajadore))
  end

  test "should destroy trabajadore" do
    assert_difference('Trabajadore.count', -1) do
      delete :destroy, id: @trabajadore
    end

    assert_redirected_to trabajadores_path
  end
end
