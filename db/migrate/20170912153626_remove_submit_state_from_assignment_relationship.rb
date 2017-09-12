class RemoveSubmitStateFromAssignmentRelationship < ActiveRecord::Migration[5.0]
  def change
    remove_column :assignment_relationships, :submit_state, :boolean
  end
end
