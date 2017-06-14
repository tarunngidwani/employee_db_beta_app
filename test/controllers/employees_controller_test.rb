require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees :employee_name_valid
  end

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

  test 'should get show' do
    get employee_url(@employee)
    assert_response :success
    assert_select 'h2', 'Employee Record'

    # Checks to ensure that the name and
    # address of specified employee is
    # being displayed
    assert_select 'p b', 2
    assert_select 'p b', 'Name:'
    assert_select 'p b', 'Address:'

    # Checks to ensure that the 2 actions
    # available for specified employee record
    # are being displayed
    assert_select 'a', 2
    assert_select 'a', 'Edit'
    assert_select 'a', 'Back'
  end
end
