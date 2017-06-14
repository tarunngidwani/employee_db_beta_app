class Employee < ApplicationRecord
  belongs_to :state

  validates :name, :house_num, :street_name, :city,
            :state_id, :zip_code, presence: true
  validates :name, :city, allow_blank: true, format: {
    with: /\A[A-Z]/,
    message: 'must begin with an uppercase letter [A-Z]'
  }
  validates :house_num, allow_blank: true, format: {
    with: /\A[0-9]+\z/,
    message: 'must be a positive numeric value'
  }
  validates :zip_code, allow_blank: true, format: {
    with: /\A[0-9]{5}\z/,
    message: 'must be exactly five digits long'
  }
end
