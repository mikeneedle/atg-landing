class AddBookedToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :booked, :string
  end
end
