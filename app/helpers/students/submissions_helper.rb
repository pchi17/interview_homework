module Students::SubmissionsHelper
  def print_submission_time(submission_time, due_date)
    if submission_time.to_date < due_date
      klass = 'text-success'
    else
      klass = 'text-danger'
    end
    
    content_tag :span, submission_time.strftime('%a, %Y %b %d %H:%M'), class: "#{klass} date"
  end
end
