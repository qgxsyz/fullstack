class CreateAnswerLikeRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_like_relationships do |t|
      t.integer :answer_id
      t.integer :user_id

      t.timestamps
    end
  end
end
