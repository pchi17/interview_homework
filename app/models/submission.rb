# == Schema Information
#
# Table name: submissions
#
#  id            :integer          not null, primary key
#  assignment_id :integer          not null
#  answer        :text             not null
#  created_at    :datetime         not null
#
# Indexes
#
#  index_submissions_on_assignment_id             (assignment_id)
#  index_submissions_on_assignment_id_and_answer  (assignment_id,answer) UNIQUE
#

class Submission < ActiveRecord::Base
  belongs_to :assignment, inverse_of: :submissions
  
  validates :assignment, presence: true
  validates :answer, presence: true, uniqueness: { case_sensitive: false, scope: :assignment_id }
end
