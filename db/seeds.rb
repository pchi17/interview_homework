# create 2 teachers
FactoryGirl.create(:teacher, username: 'philip')
FactoryGirl.create(:teacher, username: 'mike')


50.times do |i|
  FactoryGirl.create(:student, username: "student_#{i}")
end

30.times do |i|
  FactoryGirl.create(
    :homework,
    title: "Homework #{i}",
    question: "What is the meaning of #{i}?"
  )
end

User.student.find_each do |s|
  homeworks = Homework.order('random()').first(rand(5..10))
  homeworks.each do |h|
    h.assignments.create(user: s)
  end
end

Assignment.find_each do |a|
  begin
    (rand(1..5)).times do
      a.submissions.create(answer: Faker::Lorem.sentence)
    end
  rescue
    retry
  end
end

