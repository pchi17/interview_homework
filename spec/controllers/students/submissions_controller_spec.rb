require 'rails_helper'

RSpec.describe Students::SubmissionsController, type: :controller do
  let(:student)    { create(:student) }
  let(:homework)   { create(:homework) }
  let(:assignment) { create(:assignment, user: student, homework: homework) }
  
  it { expect(subject).to use_before_action(:authorize) }
  it { expect(subject).to use_before_action(:authorize_students_only) }
  it { expect(subject).to use_before_action(:get_assignment_and_homework) }

  describe '#index' do
    context 'when a user is not logged in' do
      it 'redirect_to login_path' do
        get :index, { assignment_id: assignment.id }
        expect(response).to redirect_to login_path
      end
    end
    context 'when a teacher is logged in' do
      let(:teacher) { create(:teacher) }
      let(:valid_session) { { user_id: teacher.id } }
      it 'redirect_to teachers_homeworks_path' do
        get :index, { assignment_id: assignment.id }, valid_session
        expect(response).to redirect_to root_path
      end
    end
    context 'when another student is logged in' do
      let(:another_student) { create(:student) }
      let(:valid_session)   { {user_id: another_student.id } }
      it 'redirect_to root_path' do
        get :index, { assignment_id: assignment.id }, valid_session
        expect(response).to have_http_status(404)
      end
    end
    context 'when a student is logged in' do
      let(:valid_session) { { user_id: student.id } }
      it 'render_template index' do
        get :index, { assignment_id: assignment.id }, valid_session
        expect(response).to render_template :index
      end
    end
  end
  
  describe '#new' do
    context 'when a user is not logged in' do
      it 'redirect_to login_path' do
        get :new, { assignment_id: assignment.id }
        expect(response).to redirect_to login_path
      end
    end
    context 'when a teacher is logged in' do
      let(:teacher) { create(:teacher) }
      let(:valid_session) { { user_id: teacher.id } }
      it 'redirect_to teachers_homeworks_path' do
        get :new, { assignment_id: assignment.id }, valid_session
        expect(response).to redirect_to root_path
      end
    end
    context 'when another student is logged in' do
      let(:another_student) { create(:student) }
      let(:valid_session)   { {user_id: another_student.id } }
      it 'redirect_to root_path' do
        get :new, { assignment_id: assignment.id }, valid_session
        expect(response).to have_http_status(404)
      end
    end
    context 'when a student is logged in' do
      let(:valid_session) { { user_id: student.id } }
      it 'render_template new' do
        get :new, { assignment_id: assignment.id }, valid_session
        expect(response).to render_template :new
      end
    end
  end
  
  describe '#create' do
    context 'when a user is not logged in' do
      it 'redirect_to login_path' do
        post :create, { assignment_id: assignment.id }
        expect(response).to redirect_to login_path
      end
    end
    context 'when a teacher is logged in' do
      let(:teacher) { create(:teacher) }
      let(:valid_session) { { user_id: teacher.id } }
      it 'redirect_to teachers_homeworks_path' do
        post :create, { assignment_id: assignment.id }, valid_session
        expect(response).to redirect_to root_path
      end
    end
    context 'when another student is logged in' do
      let(:another_student) { create(:student) }
      let(:valid_session)   { {user_id: another_student.id } }
      it 'redirect_to root_path' do
        post :create, { assignment_id: assignment.id }, valid_session
        expect(response).to have_http_status(404)
      end
    end
    context 'when a student is logged in' do
      let(:valid_session) { { user_id: student.id } }
      context 'with invalid answer' do
        let(:invalid_answer) { '  ' }
        let(:params) { { assignment_id: assignment.id, submission: { answer: invalid_answer } } }
        it 'render_template new' do
          post :create, params, valid_session
          expect(response).to render_template :new
        end
      end
      context 'with valid answer' do
        let(:valid_answer) { 'anything not blank' }
        let(:params) { { assignment_id: assignment.id, submission: { answer: valid_answer } } }
        it 'redirect_to students_assignment_submissions_path' do
          post :create, params, valid_session
          expect(subject).to set_flash[:success]
          expect(response).to redirect_to students_assignment_submissions_path(assignment.id)
        end
        it 'creates a new submission' do
          expect { post :create, params, valid_session }.to change { Submission.count }.by(1)
        end
      end
    end
  end
end
