# create 2 teachers
FactoryGirl.create(:teacher, username: 'philip')
FactoryGirl.create(:teacher, username: 'mike')


50.times do |i|
  FactoryGirl.create(:student, username: "student_#{i}")
end