class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :section_name
      t.boolean :is_exist_video
      t.integer :chapter_id
      t.text :content

      t.timestamps
    end
  end
end
