class State < ApplicationRecord
  validates :name, :name_abbr, presence: true
  validates :name, allow_blank: true, format: {
    with: /\A[A-Z][a-z]+( [A-Z][a-z]+)?\z/,
    message: 'must contain letters a to z with the first letter being uppercase'
  }
  validates :name_abbr, allow_blank: true, format: {
    with: /\A[A-Z][A-Z]\z/,
    message: 'must be made up of two uppercase letters, between a to z'
  }
end
