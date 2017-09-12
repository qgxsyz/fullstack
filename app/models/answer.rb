class Answer < ApplicationRecord
  belongs_to :assignment
  belongs_to :user

  has_many :answer_like_relationships
  has_many :liked_users, :through => :answer_like_relationships, :source => :user
end
