5.times do |n|
  name = Faker::Name.name
  email = "supervisor-#{n+1}@framgia.com"
  User.create!(name:  name, email: email, password: "1234567",
    password_confirmation: "1234567", role: :supervisor)
end

50.times do |n|
  name = Faker::Name.title
  description = Faker::Lorem.paragraphs(5).join(" <br /> ")
  Subject.create!(name: name, description: description)
end
