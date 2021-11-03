require 'test_helper'

class Actividades::RedacademicasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actividades_redacademicas_index_url
    assert_response :success
  end

end
