require 'test_helper'

class Evaluaciones::CalificacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evaluaciones_calificaciones_index_url
    assert_response :success
  end

  test "should get show" do
    get evaluaciones_calificaciones_show_url
    assert_response :success
  end

  test "should get new" do
    get evaluaciones_calificaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get evaluaciones_calificaciones_create_url
    assert_response :success
  end

  test "should get edit" do
    get evaluaciones_calificaciones_edit_url
    assert_response :success
  end

  test "should get update" do
    get evaluaciones_calificaciones_update_url
    assert_response :success
  end

end
