require 'test_helper'

class IndicadoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get indicadores_index_url
    assert_response :success
  end

end
