require 'test_helper'

class ExtrasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get extras_index_url
    assert_response :success
  end

  test "should get show" do
    get extras_show_url
    assert_response :success
  end

  test "should get new" do
    get extras_new_url
    assert_response :success
  end

end
