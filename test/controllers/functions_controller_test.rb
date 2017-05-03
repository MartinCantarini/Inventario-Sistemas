require 'test_helper'

class FunctionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get functions_show_url
    assert_response :success
  end

  test "should get index" do
    get functions_index_url
    assert_response :success
  end

  test "should get new" do
    get functions_new_url
    assert_response :success
  end

  test "should get create" do
    get functions_create_url
    assert_response :success
  end

  test "should get edit" do
    get functions_edit_url
    assert_response :success
  end

  test "should get update" do
    get functions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get functions_destroy_url
    assert_response :success
  end

end
