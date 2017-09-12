class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.string :chapter_name
      t.integer :learning_time
      t.integer :course_id

      t.timestamps
    end
  end
end
