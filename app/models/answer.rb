# == Schema Information
#
# Table name: answers
#
#  id            :integer          not null, primary key
#  answer_id     :integer
#  user_id       :integer
#  assignment_id :integer
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Answer < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  has_many :answer_like_relationships
  has_many :liked_users, :through => :answer_like_relationships, :source => :user
end
