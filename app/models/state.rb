class State < ApplicationRecord
  validates :name, :name_abbr, presence: true
  validates :name, allow_blank: true, format: {
    with: /\A[A-Z][a-z]+\z/,
    message: 'must contain letters a to z with the first letter being uppercase'
  }
end
