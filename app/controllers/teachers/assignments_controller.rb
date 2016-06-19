class Teachers::AssignmentsController < TeachersController
  before_action :get_homework
  
  def index
    @assignments = @homework.assignments.preload(:user, :latest_submission)
      .paginate(page: params[:page], per_page: 10)
  end
  
  def show
    @assignment  = @homework.assignments.find(params[:id]) 
    @submissions = @assignment.submissions.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @student = @assignment.user
  end
  
  private
    def get_homework
      @homework = Homework.find(params[:homework_id])
    end
end
