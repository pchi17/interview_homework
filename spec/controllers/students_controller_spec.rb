require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  it { expect(subject).to use_before_action(:authorize) }
  it { expect(subject).to use_before_action(:authorize_students_only) }
end
