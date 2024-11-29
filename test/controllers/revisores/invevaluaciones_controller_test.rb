require 'test_helper'

class Revisores::InvevaluacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revisores_invevaluaciones_index_url
    assert_response :success
  end

  test "should get show" do
    get revisores_invevaluaciones_show_url
    assert_response :success
  end

end
