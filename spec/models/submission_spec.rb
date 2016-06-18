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

require 'rails_helper'

RSpec.describe Submission, type: :model do
  let(:student)  { create(:student) }
  let(:homework) { create(:homework) }
  let(:assignment) { create(:assignment, user: student, homework: homework) }
  subject { build(:submission, assignment: assignment) }
  
  describe 'associations' do
    it { expect(subject).to belong_to(:assignment) }
  end
  
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:assignment) }
    it { expect(subject).to validate_presence_of(:answer) }
    it 'ensures each assignment submission is unique' do
      subject.save
      expect(subject).to validate_uniqueness_of(:answer).case_insensitive.scoped_to(:assignment_id)
    end
  end
end
