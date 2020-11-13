require 'test_helper'

class RedesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get redes_index_url
    assert_response :success
  end

end
