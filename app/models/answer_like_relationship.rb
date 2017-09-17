# == Schema Information
#
# Table name: answer_like_relationships
#
#  id         :integer          not null, primary key
#  answer_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AnswerLikeRelationship < ApplicationRecord
  belongs_to :answer
  belongs_to :user
end
