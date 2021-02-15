require 'test_helper'

class CargasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cargas_index_url
    assert_response :success
  end

  test "should get show" do
    get cargas_show_url
    assert_response :success
  end

  test "should get edit" do
    get cargas_edit_url
    assert_response :success
  end

  test "should get create" do
    get cargas_create_url
    assert_response :success
  end

end
