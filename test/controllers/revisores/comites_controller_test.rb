require 'test_helper'

class Revisores::ComitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revisores_comites_index_url
    assert_response :success
  end

  test "should get show" do
    get revisores_comites_show_url
    assert_response :success
  end

  test "should get new" do
    get revisores_comites_new_url
    assert_response :success
  end

  test "should get cerate" do
    get revisores_comites_cerate_url
    assert_response :success
  end

  test "should get edit" do
    get revisores_comites_edit_url
    assert_response :success
  end

  test "should get update" do
    get revisores_comites_update_url
    assert_response :success
  end

end
