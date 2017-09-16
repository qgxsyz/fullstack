# == Schema Information
#
# Table name: sections
#
#  id             :integer          not null, primary key
#  section_name   :string
#  is_exist_video :boolean
#  chapter_id     :integer
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Section < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  has_many :section_relationships

  #has_learned or has_collected TODO
  has_many :members, through: :section_relationships, source: :user

  has_many :assignments
end
