# == Schema Information
#
# Table name: assignments
#
#  id              :integer          not null, primary key
#  assignment_name :string
#  description     :text
#  section_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Assignment < ApplicationRecord
  belongs_to :section

  has_many :assignment_relationships
  
  has_many :submit_members, through: :assignment_relationship, source: :user

  has_many :answers
end
