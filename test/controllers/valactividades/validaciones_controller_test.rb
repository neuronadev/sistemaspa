require 'test_helper'

class Valactividades::ValidacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get valactividades_validaciones_index_url
    assert_response :success
  end

end
