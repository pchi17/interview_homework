require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Teachers::HomeworksHelper. For example:
#
# describe Teachers::HomeworksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Teachers::HomeworksHelper, type: :helper do
  describe '#print_due_date' do
    context 'when due date is at least 1 week in the future' do
      it { expect(print_due_date(2.weeks.from_now).include?('text-success')).to be(true) }
    end
    context 'when due date is within 1 week' do
      it { expect(print_due_date(2.days.from_now).include?('text-warning')).to be(true) }
    end
    context 'when due date is in the past' do
      it { expect(print_due_date(1.day.ago).include?('text-danger')).to be(true) }
    end
  end
end
