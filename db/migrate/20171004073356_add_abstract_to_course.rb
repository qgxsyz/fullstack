class AddAbstractToCourse < ActiveRecord::Migration[5.0]
  def change
    # 课程简介
    add_column :courses, :abstract, :string
  end
end
