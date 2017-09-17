# == Schema Information
#
# Table name: chapters
#
#  id            :integer          not null, primary key
#  chapter_name  :string
#  learning_time :integer
#  course_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Chapter < ApplicationRecord
  belongs_to :course
  has_many :sections
end
