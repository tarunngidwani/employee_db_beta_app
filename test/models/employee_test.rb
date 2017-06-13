require 'test_helper'
require_relative 'helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'name cannot be nil' do
    employee = employees :employee_name_nil_val
    assert_not_nil_empty employee, :name
  end

  test 'name cannot be empty' do
    employee = employees :employee_name_empty_val
    assert_not_nil_empty employee, :name
  end

  test 'name does not being with an uppercase letter' do
    employee = employees :employee_name_not_begins_with_uppercase_letter
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
    employee = employees :employee_house_num_nil_val
    assert_not_nil_empty employee, :house_num
  end

  test 'house number cannot be empty' do
    employee = employees :employee_house_num_empty_val
    assert_not_nil_empty employee, :house_num
  end

  test 'house number cannot be a negative value' do
    employee = employees :employee_house_num_negative_val
    assert employee.invalid?
    assert employee.errors[:house_num].any?
    assert employee.errors[:house_num],
           ['must be a positive numeric value']
  end

  test 'house number cannot be a string' do
    employee = employees :employee_house_num_string_val
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
    employee = employees :employee_street_name_nil_val
    assert_not_nil_empty employee, :street_name
  end

  test 'street name cannot be empty' do
    employee = employees :employee_street_name_empty_val
    assert_not_nil_empty employee, :street_name
  end

  test 'city cannot be nil' do
    employee = employees :employee_city_nil_val
    assert_not_nil_empty employee, :city
  end

  test 'city cannot be empty' do
    employee = employees :employee_city_empty_val
    assert_not_nil_empty employee, :city
  end

  test 'city does not being with an uppercase letter' do
    employee = employees :employee_city_not_begins_with_uppercase_letter
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
    employee = employees :employee_state_nil_val
    assert_not_nil_empty employee, :state_id
  end

  test 'state_id cannot be empty' do
    employee = employees :employee_state_empty_val
    employee.state_id = nil if employee.state_id.zero?

    assert_not_nil_empty employee, :state_id
  end
end
