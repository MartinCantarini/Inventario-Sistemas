require 'test_helper'

class RechargesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recharges_show_url
    assert_response :success
  end

  test "should get new" do
    get recharges_new_url
    assert_response :success
  end

  test "should get create" do
    get recharges_create_url
    assert_response :success
  end

  test "should get edit" do
    get recharges_edit_url
    assert_response :success
  end

  test "should get update" do
    get recharges_update_url
    assert_response :success
  end

  test "should get destroy" do
    get recharges_destroy_url
    assert_response :success
  end

end
