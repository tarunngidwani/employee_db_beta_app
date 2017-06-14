require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get employees_url
    assert_response :success
    assert_select 'h1', 'Employee Records'

    # Checks to ensure we have 5 employee records
    num_employee_records = 5
    assert_select 'tr', num_employee_records

    # Checks to ensure that we have 3 action
    # links per employee record and the display
    # value of each action
    num_of_actions_on_employee_record = 3
    num_of_action_links_for_employee_records = num_employee_records \
                                               * \
                                               num_of_actions_on_employee_record

    assert_select 'tr td a', num_of_action_links_for_employee_records
    assert_select 'tr td a', 'Show'
    assert_select 'tr td a', 'Edit'
    assert_select 'tr td a', 'Destroy'

    # Checks the total number of links on
    # page and the content of one of them
    assert_select 'a', 16
    assert_select 'a', 'Create Employee Record'
  end
end
