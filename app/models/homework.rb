# == Schema Information
#
# Table name: homeworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  question   :string           not null
#  due_date   :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Homework < ActiveRecord::Base
  has_many :assignments, inverse_of: :homework
  has_many :users,       through: :assignments
  has_many :submissions, through: :assignments
  
  validates :title,    presence: true
  validates :question, presence: true
  validates :due_date, presence: true
end
