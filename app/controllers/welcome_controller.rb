class WelcomeController < ApplicationController
  def home
    case
    when current_user.teacher?
      redirect_to teachers_homeworks_path
    when current_user.student?
      redirect_to students_assignments_path
    else
      logout
      redirect_to login_path
    end
  end
end
