class Employee < ApplicationRecord
  belongs_to :state

  validates :name, presence: true
  validates :name, allow_blank: true, format: {
      with: /\A[A-Z]/,
      message: 'must begin with an uppercase letter [A-Z]'
  }
end
