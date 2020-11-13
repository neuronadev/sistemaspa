require 'test_helper'

class ActividadesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actividades_index_url
    assert_response :success
  end

  test "should get new" do
    get actividades_new_url
    assert_response :success
  end

  test "should get create" do
    get actividades_create_url
    assert_response :success
  end

  test "should get show" do
    get actividades_show_url
    assert_response :success
  end

  test "should get edit" do
    get actividades_edit_url
    assert_response :success
  end

  test "should get update" do
    get actividades_update_url
    assert_response :success
  end

  test "should get destroy" do
    get actividades_destroy_url
    assert_response :success
  end

end
