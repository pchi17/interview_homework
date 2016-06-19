require 'rails_helper'

RSpec.describe Students::AssignmentsController, type: :controller do
  it { expect(subject).to use_before_action(:authorize) }
  it { expect(subject).to use_before_action(:authorize_students_only) }
end
