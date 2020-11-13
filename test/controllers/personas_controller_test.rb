require 'test_helper'

class PersonasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get personas_new_url
    assert_response :success
  end

end
