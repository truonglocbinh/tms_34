5.times do |n|
  subject = Subject.first
  name = Faker::Name.title
  description = Faker::Lorem.paragraphs(5).join(" <br /> ")
  Task.create!(name: name, description: description, subject_id: subject.id)
end
