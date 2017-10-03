# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_name :string
#  course_img  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string
#  is_locked   :boolean
#

class Course < ApplicationRecord
  has_many :chapters

  mount_uploader :course_img, ImageUploader

  CATEGORY = ['basic', 'major', 'optional']
  validates_inclusion_of :category, in: CATEGORY


  # 解锁
  def unlock!
    self.is_locked = false
    self.save
  end
  # 锁定
  def lock!
    self.is_locked = true
    self.save
  end
end
