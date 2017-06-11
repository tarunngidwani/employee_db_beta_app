require 'test_helper'

class StateTest < ActiveSupport::TestCase
  test 'state name cannot be nil' do
    state = states :state_name_nil_val
    assert_not_nil_empty state, :name
  end

  test 'state name cannot be empty' do
    state = states :state_name_empty_val
    assert_not_nil_empty state, :name
  end

  test 'state name abbreviation cannot be nil' do
    state = states :state_name_abbr_nil_val
    assert_not_nil_empty state, :name_abbr
  end

  test 'state name abbreviation cannot be empty' do
    state = states :state_name_abbr_empty_val
    assert_not_nil_empty state, :name_abbr
  end

  private

  # Helper method:
  # Asserts that the specified attribute value
  # for obj under test cannot be nil or empty
  def assert_not_nil_empty(obj, attr_symbol)
    assert obj.invalid?
    assert obj.errors[attr_symbol].any?
    assert_equal [(I18n.translate 'errors.messages.blank')],
                 obj.errors[attr_symbol]
  end
end
