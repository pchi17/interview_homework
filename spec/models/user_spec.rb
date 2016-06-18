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

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a validate teacher factory' do
    teacher = build(:teacher)
    expect(teacher).to be_valid
  end
  it 'has a validate student factory' do
    student = build(:student)
    expect(student).to be_valid
  end
  
  describe 'associations' do
    it { expect(subject).to have_many(:assignments) }
    it { expect(subject).to have_many(:homeworks) }
    it { expect(subject).to have_many(:submissions) }
  end
  
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:username) }
    it { expect(subject).to validate_presence_of(:role) }
    it { expect(subject).to define_enum_for(:role).with([:teacher, :student]) }
  end
end
