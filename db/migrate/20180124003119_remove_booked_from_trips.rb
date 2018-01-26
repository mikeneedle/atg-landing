class RemoveBookedFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :booked
  end
end
