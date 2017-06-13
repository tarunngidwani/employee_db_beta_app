require 'test_helper'
require_relative 'helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'employee name cannot be nil' do
    employee = employees :employee_name_nil_val
    assert_not_nil_empty employee, :name
  end

  test 'employee name cannot be empty' do
    employee = employees :employee_name_empty_val
    assert_not_nil_empty employee, :name
  end

  test 'employee name does not being with an uppercase letter' do
    employee = employees :employee_name_not_begins_with_uppercase_letter
    assert employee.invalid?
    assert employee.errors[:name].any?
    assert_equal employee.errors[:name],
                 ['must begin with an uppercase letter [A-Z]']
  end

  test 'employee name does being with an uppercase letter' do
    employee = employees :employee_name_valid
    assert employee.valid?
    assert_not employee.errors[:name].any?
    assert_equal employee.errors[:name], []
  end
end
