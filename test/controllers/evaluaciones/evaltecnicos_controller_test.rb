require 'test_helper'

class Evaluaciones::EvaltecnicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evaluaciones_evaltecnicos_index_url
    assert_response :success
  end

  test "should get show" do
    get evaluaciones_evaltecnicos_show_url
    assert_response :success
  end

  test "should get new" do
    get evaluaciones_evaltecnicos_new_url
    assert_response :success
  end

  test "should get create" do
    get evaluaciones_evaltecnicos_create_url
    assert_response :success
  end

  test "should get edit" do
    get evaluaciones_evaltecnicos_edit_url
    assert_response :success
  end

  test "should get update" do
    get evaluaciones_evaltecnicos_update_url
    assert_response :success
  end

end
