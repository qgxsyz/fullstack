# == Schema Information
#
# Table name: section_relationships
#
#  id            :integer          not null, primary key
#  section_id    :integer
#  user_id       :integer
#  has_learned   :boolean
#  has_collected :boolean
#  feel          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SectionRelationship < ApplicationRecord
  belongs_to :section
  belongs_to :user
end
