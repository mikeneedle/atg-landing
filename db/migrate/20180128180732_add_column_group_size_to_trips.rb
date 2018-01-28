class AddColumnGroupSizeToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :group_size, :integer
  end
end
