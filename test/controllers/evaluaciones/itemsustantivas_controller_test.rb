require 'test_helper'

class Evaluaciones::ItemsustantivasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evaluaciones_itemsustantivas_index_url
    assert_response :success
  end

  test "should get show" do
    get evaluaciones_itemsustantivas_show_url
    assert_response :success
  end

  test "should get new" do
    get evaluaciones_itemsustantivas_new_url
    assert_response :success
  end

  test "should get create" do
    get evaluaciones_itemsustantivas_create_url
    assert_response :success
  end

  test "should get edit" do
    get evaluaciones_itemsustantivas_edit_url
    assert_response :success
  end

  test "should get update" do
    get evaluaciones_itemsustantivas_update_url
    assert_response :success
  end

end
