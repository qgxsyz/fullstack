# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_name :string
#  course_img  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ApplicationRecord
  has_many :chapters

  mount_uploader :course_img, ImageUploader
end
