require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Students::SubmissionsHelper. For example:
#
# describe Students::SubmissionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Students::SubmissionsHelper, type: :helper do
  describe '#print_submission_time' do
    let(:due_date) { Date.today }
    context 'when submission time is before due_date' do
      it { expect(print_submission_time(1.day.ago, due_date).include?('text-success')).to be true }
    end
    context 'when submission time is after due_date' do
      it { expect(print_submission_time(1.day.from_now, due_date).include?('text-danger')).to be true }
    end
  end
end
