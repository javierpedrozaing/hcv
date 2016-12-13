require 'test_helper'

class TipoExamenesControllerTest < ActionController::TestCase
  setup do
    @tipo_examene = tipo_examenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_examenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_examene" do
    assert_difference('TipoExamene.count') do
      post :create, tipo_examene: { nombre: @tipo_examene.nombre, perfil_id: @tipo_examene.perfil_id }
    end

    assert_redirected_to tipo_examene_path(assigns(:tipo_examene))
  end

  test "should show tipo_examene" do
    get :show, id: @tipo_examene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_examene
    assert_response :success
  end

  test "should update tipo_examene" do
    patch :update, id: @tipo_examene, tipo_examene: { nombre: @tipo_examene.nombre, perfil_id: @tipo_examene.perfil_id }
    assert_redirected_to tipo_examene_path(assigns(:tipo_examene))
  end

  test "should destroy tipo_examene" do
    assert_difference('TipoExamene.count', -1) do
      delete :destroy, id: @tipo_examene
    end

    assert_redirected_to tipo_examenes_path
  end
end
