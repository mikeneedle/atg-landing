class Trip < ApplicationRecord
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  belongs_to :location
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :details, presence: true
  validates :booked, presence: true
  

end