class DropLocationFromTrips < ActiveRecord::Migration[5.1]
  def change
    remove_column :trips, :location_id
  end
end
