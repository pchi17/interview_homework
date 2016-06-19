require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  it { expect(subject).to use_before_action(:authorize) }
  it { expect(subject).to use_before_action(:authorize_teachers_only) }
end
