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

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  let(:student)  { create(:student) }
  let(:homework) { create(:homework) }
  subject { build(:assignment, user: student, homework: homework) }
  
  describe 'associations' do
    it { expect(subject).to belong_to(:user) }
    it { expect(subject).to belong_to(:homework) }
    it { expect(subject).to have_many(:submissions) }
    it { expect(subject).to have_one(:latest_submission) }
  end
  
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:user) }
    it { expect(subject).to validate_presence_of(:homework) }
    it 'validates each homework can only be assigned to a student once' do
      subject.save
      expect(subject).to validate_uniqueness_of(:user_id).scoped_to(:homework_id)
    end
  end
end
