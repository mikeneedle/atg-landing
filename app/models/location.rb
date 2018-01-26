class Location < ApplicationRecord
  has_many :trips
#  validates :description, presence: true
end