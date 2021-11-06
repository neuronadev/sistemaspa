require 'test_helper'

class Valactividades::SavalidacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get valactividades_savalidaciones_show_url
    assert_response :success
  end

end
