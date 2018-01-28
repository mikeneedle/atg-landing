class Trip < ApplicationRecord
  has_many :trip_activities
  has_many :activities, through: :trip_activities
  belongs_to :location
  belongs_to :experience
  belongs_to :flexible
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :details, presence: true
  validates :booked, presence: true
  validates :flexible, presence: true
  validates :group_size, presence: true
  validates :experience, presence: true
  #validate :start_date_before_end_date
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
  
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
  
  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end
  
  def start_date_before_end_date
    if :end_date < :start_date
      errors.add(:end_date, "must be before trip end date")
    end
  end

  def must_have_at_least_one_activity
    for activity in @trip.activities
      errors.add(:trip, "must have one activity selected")
    end
  end
 
  # def must_have_one_item
  #  for item in @request.items
  #      errors.add(:base, 'You must select at least one item') if request.item.blank?
  #  end
  #end
 
  #def discount_cannot_be_greater_than_total_value
  #  if discount > total_value
  #    errors.add(:discount, "can't be greater than total value")
  #  end
  #end
  

end