require 'test_helper'

class OfficesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get offices_show_url
    assert_response :success
  end

  test "should get index" do
    get offices_index_url
    assert_response :success
  end

  test "should get new" do
    get offices_new_url
    assert_response :success
  end

  test "should get create" do
    get offices_create_url
    assert_response :success
  end

  test "should get edit" do
    get offices_edit_url
    assert_response :success
  end

  test "should get update" do
    get offices_update_url
    assert_response :success
  end

  test "should get destroy" do
    get offices_destroy_url
    assert_response :success
  end

end
