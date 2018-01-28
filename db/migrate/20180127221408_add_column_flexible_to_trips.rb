class AddColumnFlexibleToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :flexible_id, :integer
  end
end
