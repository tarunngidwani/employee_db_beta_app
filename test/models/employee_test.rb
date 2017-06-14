require 'test_helper'
require_relative 'helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'name cannot be nil' do
    employee = Employee.new(name: nil, house_num: 123, street_name: 'Book Rd',
                            city: 'Naperville', state:
                            (states :state_name_valid_0), zip_code: 60_564)

    assert_not_nil_empty employee, :name
  end

  test 'name cannot be empty' do
    employee = Employee.new(name: '', house_num: 432, street_name: 'Park Blvd',
                            city: 'Harlem', state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert_not_nil_empty employee, :name
  end

  test 'name does not being with an uppercase letter' do
    employee = Employee.new(name: 'karl stolley', house_num: 342,
                            street_name: 'Link Blvd', city: 'Blemont',
                            state: (states :state_name_valid_0),
                            zip_code: 60_614)

    assert employee.invalid?
    assert employee.errors[:name].any?
    assert_equal employee.errors[:name],
                 ['must begin with an uppercase letter [A-Z]']
  end

  test 'name does being with an uppercase letter' do
    employee = employees :employee_name_valid
    assert employee.valid?
    assert_not employee.errors[:name].any?
    assert_equal employee.errors[:name], []
  end

  test 'house number cannot be nil' do
    employee = Employee.new(name: 'Test Name', house_num: nil,
                            street_name: 'Book Rd', city: 'Naperville',
                            state: (states :state_name_valid_0),
                            zip_code: 60_564)

    assert_not_nil_empty employee, :house_num
  end

  test 'house number cannot be empty' do
    employee = Employee.new(name: 'Fail Test', house_num: '', street_name: 'Park Blvd',
                            city: 'Harlem', state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert_not_nil_empty employee, :house_num
  end

  test 'house number cannot be a negative value' do
    employee = Employee.new(name: 'Test Fail', house_num: -122,
                            street_name: 'Park Blvd', city: 'Harlem',
                            state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert employee.invalid?
    assert employee.errors[:house_num].any?
    assert employee.errors[:house_num],
           ['must be a positive numeric value']
  end

  test 'house number cannot be a string' do
    employee = Employee.new(name: 'Test Fail', house_num: 'T122est',
                            street_name: 'Park Blvd', city: 'Harlem',
                            state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert employee.invalid?
    assert employee.errors[:house_num].any?
    assert employee.errors[:house_num],
           ['must be a positive numeric value']
  end

  test 'house number is a positive numeric value' do
    employee = employees :employee_house_num_valid
    assert employee.valid?
    assert_not employee.errors[:house_num].any?
    assert_equal employee.errors[:house_num], []
  end

  test 'street name cannot be nil' do
    employee = Employee.new(name: 'Test Fail', house_num: 122, street_name: nil,
                            city: 'Harlem', state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert_not_nil_empty employee, :street_name
  end

  test 'street name cannot be empty' do
    employee = Employee.new(name: 'Test Fail', house_num: 122, street_name: '',
                            city: 'Harlem', state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert_not_nil_empty employee, :street_name
  end

  test 'city cannot be nil' do
    employee = Employee.new(name: 'Test Fail', house_num: 122,
                            street_name: 'Filestream Land', city: nil,
                            state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert_not_nil_empty employee, :city
  end

  test 'city cannot be empty' do
    employee = Employee.new(name: 'Test Fail', house_num: 122,
                            street_name: 'File Handle', city: '',
                            state: (states :state_name_valid_0),
                            zip_code: 60_616)

    assert_not_nil_empty employee, :city
  end

  test 'city does not being with an uppercase letter' do
    employee = Employee.new(name: 'Karl Stolley', house_num: 879,
                            street_name: 'Bleek Blvd', city: 'mt. prospect',
                            state: (states :state_name_valid_1),
                            zip_code: 60_645)

    assert employee.invalid?
    assert employee.errors[:city].any?
    assert_equal employee.errors[:city],
                 ['must begin with an uppercase letter [A-Z]']
  end

  test 'city does being with an uppercase letter' do
    employee = employees :employee_city_valid
    assert employee.valid?
    assert_not employee.errors[:city].any?
    assert_equal employee.errors[:city], []
  end

  test 'state_id cannot be nil' do
    employee = Employee.new(name: 'Tony Stark', house_num: 12,
                            street_name: 'W. Iron Rd.', city: 'New York city',
                            state: nil, zip_code: 60_001)

    assert_not_nil_empty employee, :state_id
  end

  test 'state_id cannot be empty' do
    employee = Employee.new(name: 'Karl Stolley', house_num: 879,
                            street_name: 'Bleek Blvd', city: 'Mt. prospect',
                            state: State.new, zip_code: 60_645)

    assert_not_nil_empty employee, :state_id
  end

  test 'state_id does not exist but linked to employee' do
    employee = Employee.new(name: 'Silver Surfer', house_num: 12,
                            street_name: 'East Galaxy Rd.', city: 'Moon City',
                            state_id: 302_572_571_204_975_052,
                            zip_code: 10_000)

    assert employee.invalid?
    assert_not employee.errors[:state_id].any?
    assert employee.errors[:state_id], []
  end

  test 'state_id does exist and linked to employee' do
    employee = employees :employee_state_exists
    assert employee.valid?
    assert_not employee.errors[:state_id].any?
    assert employee.errors[:state_id], []
  end

  test 'zip code cannot be nil' do
    employee = Employee.new(name: 'Test Fail', house_num: 124,
                            street_name: 'Kilburne Lane', city: 'Froth',
                            state: (states :state_name_valid_1), zip_code: nil)

    assert_not_nil_empty employee, :zip_code
  end

  test 'zip code cannot be empty' do
    employee = Employee.new(name: 'Test Fail', house_num: 124,
                            street_name: 'Kilburne Lane', city: 'Froth',
                            state: (states :state_name_valid_0), zip_code: '')

    assert_not_nil_empty employee, :zip_code
  end

  test 'multiple invalid zip codes' do
    invalid_employees = [
      Employee.new(name: 'Test Fail', house_num: 124,
                   street_name: 'Kilburne Lane', city: 'Froth',
                   state: (states :state_name_valid_1), zip_code: 1_871),
      Employee.new(name: 'Test Fail', house_num: 124,
                   street_name: 'Kilburne Lane', city: 'Froth',
                   state: (states :state_name_valid_1), zip_code: 187_189),
      Employee.new(name: 'Test Fail', house_num: 124,
                   street_name: 'Kilburne Lane', city: 'Froth',
                   state: (states :state_name_valid_1), zip_code: '19871code'),
      Employee.new(name: 'Test Fail', house_num: 124,
                   street_name: 'Kilburne Lane', city: 'Froth',
                   state: (states :state_name_valid_1), zip_code: 'ninteen eighty one')
    ]
    invalid_employees.each do |employee|
      assert employee.invalid?
      assert employee.errors[:zip_code].any?
      assert_equal employee.errors[:zip_code],
                   ['must be exactly five digits long']

    end
  end

  test 'valid zip code' do
    employee = employees :employee_zip_code_valid
    assert employee.valid?
    assert_not employee.errors[:zip_code].any?
    assert_equal employee.errors[:zip_code], []
  end
end
