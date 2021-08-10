require 'test_helper'

class DivulgacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get divulgaciones_index_url
    assert_response :success
  end

  test "should get new" do
    get divulgaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get divulgaciones_create_url
    assert_response :success
  end

  test "should get show" do
    get divulgaciones_show_url
    assert_response :success
  end

  test "should get edit" do
    get divulgaciones_edit_url
    assert_response :success
  end

  test "should get update" do
    get divulgaciones_update_url
    assert_response :success
  end

end
