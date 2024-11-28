require 'test_helper'

class Revisores::AdicionalesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get revisores_adicionales_show_url
    assert_response :success
  end

end
