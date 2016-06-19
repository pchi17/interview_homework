class StudentsController < ApplicationController
  before_action :authorize_students_only
  
  protected
    def authorize_students_only
      redirect_to root_path unless current_user.student?
    end
end
