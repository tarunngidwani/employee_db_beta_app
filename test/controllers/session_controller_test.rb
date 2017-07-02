require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

  test 'should get login' do
    get login_url
    assert_response :success

    notice = ''
    test_login_page_content notice
  end

  test 'redirect to login page no user logged in' do
    get employees_url
    assert_redirected_to login_url

    get login_url
    test_login_page_content 'Please login before proceeding'
  end

  private

  def test_login_page_content(notice)
    assert_select 'p', notice
    assert_select 'h1', 'Employee Records Login'
    assert_select 'a', 'Login with GitHub'
  end
end
