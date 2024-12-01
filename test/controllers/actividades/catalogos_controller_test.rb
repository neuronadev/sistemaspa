require 'test_helper'

class Actividades::CatalogosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actividades_catalogos_index_url
    assert_response :success
  end

  test "should get show" do
    get actividades_catalogos_show_url
    assert_response :success
  end

  test "should get new" do
    get actividades_catalogos_new_url
    assert_response :success
  end

  test "should get create" do
    get actividades_catalogos_create_url
    assert_response :success
  end

  test "should get edit" do
    get actividades_catalogos_edit_url
    assert_response :success
  end

  test "should get update" do
    get actividades_catalogos_update_url
    assert_response :success
  end

end
