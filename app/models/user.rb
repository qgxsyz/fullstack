class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sections

  has_many :section_relationships
 # TODO 条件
  has_many :learned_sections, :through => :section_relationships, :source => :section
  has_many :collected_sections, :through => :section_relationships, :source => :section


 has_many :assignment_relationships
 # TODO 条件
  has_many :submited_assignments, :through => :assignment_relationships, :source => :assignment

  has_many :answers

  has_many :answer_like_relationships
  has_many :liked_answers, :through => :answer_like_relationships, :source => :answer

end
