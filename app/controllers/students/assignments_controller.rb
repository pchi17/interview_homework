class Students::AssignmentsController < StudentsController
  def index
    render text: controller_path
  end
  
  def show
    render text: controller_path
  end
end
