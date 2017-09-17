class AddMoreDetailToCourse < ActiveRecord::Migration[5.0]
  def change
    # basic major optional
    add_column :courses, :category, :string

    # 是否是锁定状态
    add_column :courses, :is_locked, :boolean
  end
end
