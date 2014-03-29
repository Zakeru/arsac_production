require 'test_helper'

class ParteobrasControllerTest < ActionController::TestCase
  setup do
    @parteobra = parteobras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parteobras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parteobra" do
    assert_difference('Parteobra.count') do
      post :create, parteobra: { casa: @parteobra.casa, fechaingreso: @parteobra.fechaingreso, frente: @parteobra.frente, jefefrente: @parteobra.jefefrente, maestrodeobra: @parteobra.maestrodeobra, numeroparte: @parteobra.numeroparte, subcontratista: @parteobra.subcontratista }
    end

    assert_redirected_to parteobra_path(assigns(:parteobra))
  end

  test "should show parteobra" do
    get :show, id: @parteobra
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parteobra
    assert_response :success
  end

  test "should update parteobra" do
    put :update, id: @parteobra, parteobra: { casa: @parteobra.casa, fechaingreso: @parteobra.fechaingreso, frente: @parteobra.frente, jefefrente: @parteobra.jefefrente, maestrodeobra: @parteobra.maestrodeobra, numeroparte: @parteobra.numeroparte, subcontratista: @parteobra.subcontratista }
    assert_redirected_to parteobra_path(assigns(:parteobra))
  end

  test "should destroy parteobra" do
    assert_difference('Parteobra.count', -1) do
      delete :destroy, id: @parteobra
    end

    assert_redirected_to parteobras_path
  end
end
