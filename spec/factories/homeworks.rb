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

FactoryGirl.define do
  factory :homework do
    title    { Faker::Lorem.sentence(3, false, 0) }
    question { Faker::Lorem.sentence(6, false, 0) }
    due_date { Faker::Date.forward(30) }
  end
end
