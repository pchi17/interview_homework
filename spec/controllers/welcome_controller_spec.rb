require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  it { expect(subject).to use_before_action(:authorize) }
  
  describe "GET #home" do
    context 'when user is not logged in' do
      it "redirects to login page if user is not logged in" do
        get :home
        expect(response).to redirect_to login_url
      end
    end
    
    context 'when a teacher is logged in' do
      let(:teacher) {FactoryGirl.create(:teacher)}
      let(:valid_session) {{user_id: teacher.id}}
      it "returns redirect_to teachers_homeworks_path" do
        get :home, {}, valid_session
        expect(response).to redirect_to teachers_homeworks_path
      end
    end
    
    context 'when a student is logged in' do
      let(:student) {FactoryGirl.create(:student)}
      let(:valid_session) {{user_id: student.id}}
      it "returns redirect_to students_assignments_path" do
        get :home, {}, valid_session
        expect(response).to redirect_to students_assignments_path
      end
    end

  end

end
