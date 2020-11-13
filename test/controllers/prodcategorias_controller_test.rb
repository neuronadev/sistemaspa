require 'test_helper'

class ProdcategoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prodcategorias_index_url
    assert_response :success
  end

  test "should get new" do
    get prodcategorias_new_url
    assert_response :success
  end

  test "should get create" do
    get prodcategorias_create_url
    assert_response :success
  end

  test "should get show" do
    get prodcategorias_show_url
    assert_response :success
  end

  test "should get update" do
    get prodcategorias_update_url
    assert_response :success
  end

  test "should get destroy" do
    get prodcategorias_destroy_url
    assert_response :success
  end

end
