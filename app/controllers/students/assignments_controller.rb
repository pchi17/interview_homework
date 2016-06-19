class Students::AssignmentsController < StudentsController
  def index
    @assignments = current_user.assignments.includes(:homework).order('homeworks.due_date ASC')
      .paginate(page: params[:page], per_page: 5)
  end
end
