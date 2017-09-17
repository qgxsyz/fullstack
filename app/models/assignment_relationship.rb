# == Schema Information
#
# Table name: assignment_relationships
#
#  id            :integer          not null, primary key
#  assignment_id :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class AssignmentRelationship < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
end
