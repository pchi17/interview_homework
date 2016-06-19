class Students::SubmissionsController < StudentsController
  before_action :get_assignment_and_homework
  def index
    @submissions = @assignment.submissions.order(created_at: :desc)
      .paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @submission = @assignment.submissions.build
  end
  
  def create
    @submission = @assignment.submissions.build(submission_params)
    if @submission.save
      flash[:success] = 'Answer Submitted!'
      redirect_to students_assignment_submissions_path(@assignment)
    else
      render :new
    end
  end
  
  private
    def get_assignment_and_homework
      @assignment = current_user.assignments.find(params[:assignment_id])
      @homework = @assignment.homework
    end
    
    def submission_params
      params.require(:submission).permit(:answer)
    end
end
