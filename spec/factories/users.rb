# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  role       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#

FactoryGirl.define do
  factory :user do
    factory :teacher do
      sequence(:username){|n| "teacher#{n}"}
      role 'teacher'
    end
    factory :student do
      sequence(:username){|n| "student#{n}"}
      role 'student'
    end
  end
end
