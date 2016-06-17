require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { expect(subject).to validate_presence_of(:username) }
    it { expect(subject).to validate_presence_of(:role) }
    it { expect(subject).to define_enum_for(:role).with([:teacher, :student]) }
  end
end
