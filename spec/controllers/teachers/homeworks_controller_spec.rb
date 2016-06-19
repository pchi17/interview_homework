require 'rails_helper'

RSpec.describe Teachers::HomeworksController, type: :controller do
  it { expect(subject).to use_before_action(:authorize) }
  it { expect(subject).to use_before_action(:authorize_teachers_only) }
  
  describe '#index' do
    context 'when a user is not logged in' do
      it 'redirect_to login_path' do
        get :index
        expect(response).to redirect_to login_path
      end
    end
    context 'when a teacher is logged in' do
      let(:teacher) { create(:teacher) }
      let(:valid_session) { { user_id: teacher.id } }
      it 'render_template index' do
        get :index, {}, valid_session
        expect(response).to render_template :index
      end
    end
    context 'when a student is logged in' do
      let(:student) { create(:student) }
      let(:valid_session) { { user_id: student.id } }
      it 'redirect_to root_path' do
        get :index, {}, valid_session
        expect(response).to redirect_to root_path
      end
    end
  end
end
