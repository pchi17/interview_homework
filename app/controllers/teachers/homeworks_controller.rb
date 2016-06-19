class Teachers::HomeworksController < TeachersController
  def index
    @homeworks = Homework.joins(
    <<-SQL
      JOIN (
        SELECT homework_id, COUNT(*) AS student_count
        FROM assignments 
        GROUP BY 1
      ) AS a 
      ON a.homework_id = homeworks.id
    SQL
    )
    .select('id, title, question, due_date, student_count')
    .order('due_date ASC, student_count DESC')
    .paginate(page: params[:page], per_page: 10)
  end
end
