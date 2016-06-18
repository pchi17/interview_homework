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

require 'rails_helper'

RSpec.describe Homework, type: :model do
  subject { build(:homework) }
  
  it 'has a valid factory' do
    expect(subject).to be_valid
  end
  
  describe 'associations' do
    it { expect(subject).to have_many(:assignments) }
    it { expect(subject).to have_many(:users) }
    it { expect(subject).to have_many(:submissions) }
  end
  
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:title) }
    it { expect(subject).to validate_presence_of(:question) }
    it { expect(subject).to validate_presence_of(:due_date) }
  end
end
