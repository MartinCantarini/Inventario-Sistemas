require 'test_helper'

class PrintersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get printers_show_url
    assert_response :success
  end

  test "should get index" do
    get printers_index_url
    assert_response :success
  end

  test "should get new" do
    get printers_new_url
    assert_response :success
  end

  test "should get create" do
    get printers_create_url
    assert_response :success
  end

  test "should get edit" do
    get printers_edit_url
    assert_response :success
  end

  test "should get update" do
    get printers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get printers_destroy_url
    assert_response :success
  end

end
