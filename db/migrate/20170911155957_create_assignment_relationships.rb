class CreateAssignmentRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :assignment_relationships do |t|
      t.integer :assignment_id
      t.integer :user_id
      t.boolean :submit_state

      t.timestamps
    end
  end
end
