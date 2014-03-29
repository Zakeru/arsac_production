require 'test_helper'

class EquiposregistradosControllerTest < ActionController::TestCase
  setup do
    @equiposregistrado = equiposregistrados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equiposregistrados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equiposregistrado" do
    assert_difference('Equiposregistrado.count') do
      post :create, equiposregistrado: { cantidad: @equiposregistrado.cantidad, fin: @equiposregistrado.fin, frente_id: @equiposregistrado.frente_id, inicio: @equiposregistrado.inicio, partidasdecontrol_id: @equiposregistrado.partidasdecontrol_id, sectore_id: @equiposregistrado.sectore_id, subsectore_id: @equiposregistrado.subsectore_id, subunidad: @equiposregistrado.subunidad, unidade_id: @equiposregistrado.unidade_id }
    end

    assert_redirected_to equiposregistrado_path(assigns(:equiposregistrado))
  end

  test "should show equiposregistrado" do
    get :show, id: @equiposregistrado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equiposregistrado
    assert_response :success
  end

  test "should update equiposregistrado" do
    put :update, id: @equiposregistrado, equiposregistrado: { cantidad: @equiposregistrado.cantidad, fin: @equiposregistrado.fin, frente_id: @equiposregistrado.frente_id, inicio: @equiposregistrado.inicio, partidasdecontrol_id: @equiposregistrado.partidasdecontrol_id, sectore_id: @equiposregistrado.sectore_id, subsectore_id: @equiposregistrado.subsectore_id, subunidad: @equiposregistrado.subunidad, unidade_id: @equiposregistrado.unidade_id }
    assert_redirected_to equiposregistrado_path(assigns(:equiposregistrado))
  end

  test "should destroy equiposregistrado" do
    assert_difference('Equiposregistrado.count', -1) do
      delete :destroy, id: @equiposregistrado
    end

    assert_redirected_to equiposregistrados_path
  end
end
