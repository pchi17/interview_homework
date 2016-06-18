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

class User < ActiveRecord::Base
  enum role: [:teacher, :student]
  
  has_many :assignments, inverse_of: :user
  has_many :homeworks,   through: :assignments
  has_many :submissions, through: :assignments
  
  validates :username, presence: true, uniqueness: true
  validates :role,     presence: true
end
