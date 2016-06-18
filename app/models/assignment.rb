# == Schema Information
#
# Table name: assignments
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  homework_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_assignments_on_user_id_and_homework_id  (user_id,homework_id) UNIQUE
#

class Assignment < ActiveRecord::Base
  belongs_to :user,     inverse_of: :assignments
  belongs_to :homework, inverse_of: :assignments
  
  has_many :submissions, inverse_of: :assignment
  has_one  :latest_submission, -> { order(created_at: :desc) }, class_name: Submission
  
  validates :user,     presence: true
  validates :homework, presence: true
  validates :user_id, uniqueness: { scope: :homework_id }
end
