require 'test_helper'

class InicioControllerTest < ActionDispatch::IntegrationTest
  test "should get sesion" do
    get inicio_sesion_url
    assert_response :success
  end

end
