require 'test_helper'
require 'helpers/omniauth_login_test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  include OmniauthLoginTestHelper

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

  test 'login successful by user' do
    provider = 'github'
    user_name = 'Lex Luther'
    login provider, user_name

    assert_redirected_to employees_url
  end

  test 'logout successfully by user' do
    provider = 'github'
    user_name = 'Lex Luther'
    login provider, user_name

    delete logout_url
    assert_redirected_to login_url

    get login_url
    notice = 'You have been logged out'
    test_login_page_content notice
  end

  private

  def test_login_page_content(notice)
    assert_select 'p', notice
    assert_select 'h1', 'Employee Records Login'
    assert_select 'a', 'Login with GitHub'
  end
end
