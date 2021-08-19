require 'test_helper'

class PosgradosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get posgrados_index_url
    assert_response :success
  end

  test "should get new" do
    get posgrados_new_url
    assert_response :success
  end

  test "should get create" do
    get posgrados_create_url
    assert_response :success
  end

  test "should get show" do
    get posgrados_show_url
    assert_response :success
  end

  test "should get edit" do
    get posgrados_edit_url
    assert_response :success
  end

  test "should get update" do
    get posgrados_update_url
    assert_response :success
  end

end
