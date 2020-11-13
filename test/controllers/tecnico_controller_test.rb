require 'test_helper'

class TecnicoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tecnico_index_url
    assert_response :success
  end

end
