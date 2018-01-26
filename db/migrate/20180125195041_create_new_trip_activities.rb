class CreateNewTripActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :new_trip_activities do |t|
      t.integer :trip_id
      t.integer :activity_id
    end
  end
end
