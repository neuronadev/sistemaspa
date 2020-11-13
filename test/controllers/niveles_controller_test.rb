require 'test_helper'

class NivelesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get niveles_index_url
    assert_response :success
  end

  test "should get new" do
    get niveles_new_url
    assert_response :success
  end

  test "should get create" do
    get niveles_create_url
    assert_response :success
  end

  test "should get show" do
    get niveles_show_url
    assert_response :success
  end

  test "should get update" do
    get niveles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get niveles_destroy_url
    assert_response :success
  end

end
