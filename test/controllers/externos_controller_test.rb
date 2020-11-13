require 'test_helper'

class ExternosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get externos_index_url
    assert_response :success
  end

  test "should get new" do
    get externos_new_url
    assert_response :success
  end

  test "should get create" do
    get externos_create_url
    assert_response :success
  end

  test "should get show" do
    get externos_show_url
    assert_response :success
  end

  test "should get edit" do
    get externos_edit_url
    assert_response :success
  end

  test "should get update" do
    get externos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get externos_destroy_url
    assert_response :success
  end

end
