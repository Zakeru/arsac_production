require 'test_helper'

class PartedeequiposControllerTest < ActionController::TestCase
  setup do
    @partedeequipo = partedeequipos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partedeequipos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partedeequipo" do
    assert_difference('Partedeequipo.count') do
      post :create, partedeequipo: { fecha: @partedeequipo.fecha, insumodeequipo_id: @partedeequipo.insumodeequipo_id, numero: @partedeequipo.numero, subcontratodeequipo_id: @partedeequipo.subcontratodeequipo_id }
    end

    assert_redirected_to partedeequipo_path(assigns(:partedeequipo))
  end

  test "should show partedeequipo" do
    get :show, id: @partedeequipo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @partedeequipo
    assert_response :success
  end

  test "should update partedeequipo" do
    put :update, id: @partedeequipo, partedeequipo: { fecha: @partedeequipo.fecha, insumodeequipo_id: @partedeequipo.insumodeequipo_id, numero: @partedeequipo.numero, subcontratodeequipo_id: @partedeequipo.subcontratodeequipo_id }
    assert_redirected_to partedeequipo_path(assigns(:partedeequipo))
  end

  test "should destroy partedeequipo" do
    assert_difference('Partedeequipo.count', -1) do
      delete :destroy, id: @partedeequipo
    end

    assert_redirected_to partedeequipos_path
  end
end
