class Section < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  has_many :section_relationships

  #has_learned or has_collected TODO
  has_many :members, through: :section_relationships, source: :user

  has_many :assignments
end
