require 'test_helper'
require_relative 'helper'

class StateTest < ActiveSupport::TestCase
  test 'state name cannot be nil' do
    state = states :state_name_nil_val
    assert_not_nil_empty state, :name
  end

  test 'state name cannot be empty' do
    state = states :state_name_empty_val
    assert_not_nil_empty state, :name
  end

  test 'state name is invalid' do
    invalid_states = [
      states(:state_name_invalid_0), states(:state_name_invalid_1),
      states(:state_name_invalid_2), states(:state_name_invalid_3),
      states(:state_name_invalid_4)
    ]
    invalid_states.each do |state|
      assert state.invalid?
      assert state.errors[:name].any?
      assert_equal state.errors[:name],
                   ['must contain letters a to z with the first letter being ' \
                      'uppercase']
    end
  end

  test 'state name is valid' do
    valid_states = [states(:state_name_valid_0), states(:state_name_valid_1)]

    valid_states.each do |state|
      assert state.valid?
      assert_not state.errors[:name].any?
      assert_equal state.errors[:name], []
    end
  end

  test 'state name abbreviation cannot be nil' do
    state = states :state_name_abbr_nil_val
    assert_not_nil_empty state, :name_abbr
  end

  test 'state name abbreviation cannot be empty' do
    state = states :state_name_abbr_empty_val
    assert_not_nil_empty state, :name_abbr
  end

  test 'state name abbreviation is invalid' do
    state = states :state_name_abbr_invalid
    assert state.invalid?
    assert state.errors[:name_abbr].any?
    assert_equal state.errors[:name_abbr],
                 ['must be made up of two uppercase letters, between a to z']
  end

  test 'state name abbreviation is valid' do
    state = states :state_name_abbr_valid
    assert state.valid?
    assert_not state.errors[:name_abbr].any?
    assert_equal state.errors[:name_abbr], []
  end
end
