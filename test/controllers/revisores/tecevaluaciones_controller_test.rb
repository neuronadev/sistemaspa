require 'test_helper'

class Revisores::TecevaluacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revisores_tecevaluaciones_index_url
    assert_response :success
  end

end
