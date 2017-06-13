class Employee < ApplicationRecord
  belongs_to :state

  validates :name, :house_num, presence: true
  validates :name, allow_blank: true, format: {
    with: /\A[A-Z]/,
    message: 'must begin with an uppercase letter [A-Z]'
  }
  validates :house_num, allow_blank: true, format: {
    with: /\A[0-9]+\z/,
    message: 'must be a positive numeric value'
  }
end
