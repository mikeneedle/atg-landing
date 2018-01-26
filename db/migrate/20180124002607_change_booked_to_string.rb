class ChangeBookedToString < ActiveRecord::Migration[5.1]
  def change
    change_column :trips, :booked, :string
  end
end
