class CreateExperience < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :description
    end
  end
end
