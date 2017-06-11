class State < ApplicationRecord
  validates :name, :name_abbr, presence: true
end
