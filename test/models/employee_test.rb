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
end
