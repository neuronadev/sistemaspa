require 'test_helper'

class InvestigadorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get investigador_index_url
    assert_response :success
  end

end
