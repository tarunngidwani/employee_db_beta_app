require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees :employee_name_valid
    @new_valid_employee = {
      name: 'Clark Kent',
      house_num: '777',
      street_name: 'Barn Door Rd.',
      city: 'Smallville',
      state_id: (states :state_name_valid_1).id,
      zip_code: '12442'
    }
    @new_invalid_employee = {
      name: 'clark kent',
      house_num: '777',
      street_name: 'Barn Door Rd.',
      city: 'Smallville',
      state_id: (states :state_name_valid_1).id,
      zip_code: '12442'
    }
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

  test 'should get new' do
    get new_employee_url
    assert_response :success
    assert_select 'h2', 'New Employee Record'

    # Checks for total number of fields
    # on page
    assert_select '.field', 6

    # Checks to ensure that the labels
    # of each field are rendered onto the
    # page correctly
    assert_select '.field label', 6
    assert_select '.field label', 'Name'
    assert_select '.field label', 'House num'
    assert_select '.field label', 'Street name'
    assert_select '.field label', 'City'
    assert_select '.field label', 'State'
    assert_select '.field label', 'Zip code'

    # Checks to ensure that the inputs
    # of each field are rendered onto the
    # page correctly
    assert_select '.field input', 5
    assert_select '.field select', 1

    # Checks to ensure that the dropdown
    # is getting populated from the data
    # in our states fixture file
    assert_select '.field select option', 13

    # Checks to ensure we see the
    # Create Employee submit button
    assert_select '.actions', 1
    assert_select '.actions input', 1

    # Checks to ensure we see the
    # back action link
    assert_select 'a', 1
    assert_select 'a', 'Back'
  end

  test 'should not create new employee record' do
    assert_no_difference('Employee.count') do
      post employees_url, params: { employee: @new_invalid_employee }
    end

    assert_template :new
  end

  test 'should create new employee record' do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: @new_valid_employee }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test 'should destroy specified employee record' do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
