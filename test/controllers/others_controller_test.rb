require 'test_helper'

class OthersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get others_index_url
    assert_response :success
  end

  test "should get index1" do
    get others_index1_url
    assert_response :success
  end

  test "should get index2" do
    get others_index2_url
    assert_response :success
  end

end
