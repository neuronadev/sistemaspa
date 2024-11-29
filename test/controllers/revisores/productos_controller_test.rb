require 'test_helper'

class Revisores::ProductosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get revisores_productos_show_url
    assert_response :success
  end

end
