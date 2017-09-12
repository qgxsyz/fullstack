class CreateSectionRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :section_relationships do |t|
      t.integer :section_id
      t.integer :user_id
      t.boolean :has_learned
      t.boolean :has_collected
      t.integer :feel

      t.timestamps
    end
  end
end
