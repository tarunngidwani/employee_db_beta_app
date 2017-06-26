require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get developer_auth_url
    assert_response :success
  end

  test "should get destroy" do
    get root_url
    assert_response :success
  end

end
