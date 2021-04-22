# Create 100 fake users
100.times do
  name = Faker::FunnyName.name
  email = Faker::Internet.email

  User.create(name: name, email: email)
end