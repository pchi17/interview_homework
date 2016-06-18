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

FactoryGirl.define do
  factory :assignment do
    user
    homework
  end
end
