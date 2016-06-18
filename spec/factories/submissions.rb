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

FactoryGirl.define do
  factory :submission do
    assignment
    answer { Faker::Lorem.sentence(5, false, 0) }
  end

end
