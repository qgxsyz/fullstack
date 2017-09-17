# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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

  def admin?
    is_admin
  end
end
