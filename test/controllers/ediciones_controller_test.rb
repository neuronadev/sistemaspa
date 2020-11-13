require 'test_helper'

class EdicionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ediciones_index_url
    assert_response :success
  end

end
