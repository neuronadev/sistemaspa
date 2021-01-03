require 'test_helper'

class AcademicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get academicos_index_url
    assert_response :success
  end

  test "should get show" do
    get academicos_show_url
    assert_response :success
  end

end
