class DropTableTripActivities < ActiveRecord::Migration[5.1]
  def change
    drop_table :trip_activities
  end
end
