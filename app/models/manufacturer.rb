class Manufacturer < ApplicationRecord
  validates :name, uniqueness: true
end
