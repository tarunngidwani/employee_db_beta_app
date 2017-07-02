require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest

  test 'should get login' do
    get login_url
    assert_response :success

    notice = ''
    test_login_page_content notice
  end

  private

  def test_login_page_content(notice)
    assert_select 'p', notice
    assert_select 'h1', 'Employee Records Login'
    assert_select 'a', 'Login with GitHub'
  end
end
