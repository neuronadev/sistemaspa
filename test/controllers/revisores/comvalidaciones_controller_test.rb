require 'test_helper'

class Revisores::ComvalidacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get revisores_comvalidaciones_index_url
    assert_response :success
  end

  test "should get new" do
    get revisores_comvalidaciones_new_url
    assert_response :success
  end

  test "should get edit" do
    get revisores_comvalidaciones_edit_url
    assert_response :success
  end

end
