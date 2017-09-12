class Assignment < ApplicationRecord
  belongs_to :section

  has_many :assignment_relationships
  
  has_many :submit_members, through: :assignment_relationship, source: :user

  has_many :answers
end
