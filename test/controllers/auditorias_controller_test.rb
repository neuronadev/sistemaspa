require 'test_helper'

class AuditoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auditorias_index_url
    assert_response :success
  end

end
