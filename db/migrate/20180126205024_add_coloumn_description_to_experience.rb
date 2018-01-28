class AddColoumnDescriptionToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :description, :string
  end
end
