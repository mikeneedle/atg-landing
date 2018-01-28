class CreateFlexibles < ActiveRecord::Migration[5.1]
  def change
    create_table :flexibles do |t|
      t.string :description
    end
  end
end
