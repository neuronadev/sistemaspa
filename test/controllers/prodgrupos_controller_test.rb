require 'test_helper'

class ProdgruposControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prodgrupos_index_url
    assert_response :success
  end

  test "should get new" do
    get prodgrupos_new_url
    assert_response :success
  end

  test "should get create" do
    get prodgrupos_create_url
    assert_response :success
  end

  test "should get show" do
    get prodgrupos_show_url
    assert_response :success
  end

  test "should get update" do
    get prodgrupos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prodgrupos_destroy_url
    assert_response :success
  end

end
