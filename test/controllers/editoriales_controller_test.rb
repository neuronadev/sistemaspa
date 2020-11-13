require 'test_helper'

class EditorialesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get editoriales_index_url
    assert_response :success
  end

  test "should get new" do
    get editoriales_new_url
    assert_response :success
  end

  test "should get create" do
    get editoriales_create_url
    assert_response :success
  end

  test "should get show" do
    get editoriales_show_url
    assert_response :success
  end

  test "should get edit" do
    get editoriales_edit_url
    assert_response :success
  end

  test "should get update" do
    get editoriales_update_url
    assert_response :success
  end

  test "should get destroy" do
    get editoriales_destroy_url
    assert_response :success
  end

end
