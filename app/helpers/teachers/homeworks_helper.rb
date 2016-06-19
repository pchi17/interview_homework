module Teachers::HomeworksHelper
  def print_due_date(due_date)
    klass = case
    when due_date > 1.week.from_now
      'text-success'
    when due_date >= Date.today
      'text-warning'
    when due_date < Date.today
      'text-danger'
    end
    
    content_tag :span, due_date.strftime('%a, %b %d, %Y'), class: "#{klass} date"
  end
end
