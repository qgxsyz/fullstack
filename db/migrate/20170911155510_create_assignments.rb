class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.text :description
      t.integer :section_id

      t.timestamps
    end
  end
end
