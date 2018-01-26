class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :details
      t.integer :booked
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
