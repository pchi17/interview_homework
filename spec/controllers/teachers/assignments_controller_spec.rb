require 'rails_helper'

RSpec.describe Teachers::AssignmentsController, type: :controller do
  let(:homework)   { create(:homework) }
  let(:student)    { create(:student) }
  let(:assignment) { create(:assignment, user: student, homework: homework) }
  
  it { expect(subject).to use_before_action(:authorize) }
  it { expect(subject).to use_before_action(:authorize_teachers_only) }
  it { expect(subject).to use_before_action(:get_homework) }
  
  describe '#index' do
    let(:params) { { homework_id: homework.id } }
    context 'when a user is not logged in' do
      it 'redirect_to login_path' do
        get :index, params
        expect(response).to redirect_to login_path
      end
    end
    context 'when a teacher is logged in' do
      let(:teacher) { create(:teacher) }
      let(:valid_session) { { user_id: teacher.id } }
      it 'render_template index' do
        get :index, params, valid_session
        expect(response).to render_template :index
      end
    end
    context 'when a student is logged in' do
      let(:student) { create(:student) }
      let(:valid_session) { { user_id: student.id } }
      it 'redirect_to root_path' do
        get :index, params, valid_session
        expect(response).to redirect_to root_path
      end
    end
  end
  
  describe '#show' do
    let(:params) { { homework_id: homework.id, id: assignment.id } }
    context 'when a user is not logged in' do
      it 'redirect_to login_path' do
        get :show, params
        expect(response).to redirect_to login_path
      end
    end
    context 'when a teacher is logged in' do
      let(:teacher) { create(:teacher) }
      let(:valid_session) { { user_id: teacher.id } }
      it 'render_template show' do
        get :show, params, valid_session
        expect(response).to render_template :show
      end
    end
    context 'when a student is logged in' do
      let(:student) { create(:student) }
      let(:valid_session) { { user_id: student.id } }
      it 'redirect_to root_path' do
        get :show, params, valid_session
        expect(response).to redirect_to root_path
      end
    end
  end
end
