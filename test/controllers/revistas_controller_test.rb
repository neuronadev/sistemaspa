require 'test_helper'

class RevistasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revistas_index_url
    assert_response :success
  end

  test "should get new" do
    get revistas_new_url
    assert_response :success
  end

  test "should get create" do
    get revistas_create_url
    assert_response :success
  end

  test "should get show" do
    get revistas_show_url
    assert_response :success
  end

  test "should get edit" do
    get revistas_edit_url
    assert_response :success
  end

  test "should get update" do
    get revistas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get revistas_destroy_url
    assert_response :success
  end

end
