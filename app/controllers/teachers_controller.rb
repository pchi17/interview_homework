class TeachersController < ApplicationController
  before_action :authorize_teachers_only
  
  protected
    def authorize_teachers_only
      redirect_to root_path unless current_user.teacher?
    end
end
