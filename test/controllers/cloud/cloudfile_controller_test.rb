require 'test_helper'

class Cloud::CloudfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cloud_cloudfile_index_url
    assert_response :success
  end

  test "should get show" do
    get cloud_cloudfile_show_url
    assert_response :success
  end

  test "should get new" do
    get cloud_cloudfile_new_url
    assert_response :success
  end

  test "should get create" do
    get cloud_cloudfile_create_url
    assert_response :success
  end

end
