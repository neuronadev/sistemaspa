require 'test_helper'

class PuntosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get puntos_index_url
    assert_response :success
  end

  test "should get show" do
    get puntos_show_url
    assert_response :success
  end

end
