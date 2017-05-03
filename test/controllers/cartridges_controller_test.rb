require 'test_helper'

class CartridgesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cartridges_show_url
    assert_response :success
  end

  test "should get index" do
    get cartridges_index_url
    assert_response :success
  end

  test "should get new" do
    get cartridges_new_url
    assert_response :success
  end

  test "should get create" do
    get cartridges_create_url
    assert_response :success
  end

  test "should get edit" do
    get cartridges_edit_url
    assert_response :success
  end

  test "should get update" do
    get cartridges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cartridges_destroy_url
    assert_response :success
  end

end
