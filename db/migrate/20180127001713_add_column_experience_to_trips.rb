class AddColumnExperienceToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :experience_id, :integer
  end
end
