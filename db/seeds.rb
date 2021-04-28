# Create 750 fake users
# 750 names is the limit for Faker gem
# rand(..) - used as a simple replacement of a random ID value
750.times do
  name = Faker::FunnyName.unique.name
  email = Faker::Internet.unique.email

  User.create(name: name, email: email)
end

300.times do
  Channel.create(user_id: rand(1..250), recipient_id: rand(250..750), name: Faker::Game.title)
end

2000.times do
  Message.create(user_id: rand(1..30), channel_id: rand(1..10), message: Faker::ChuckNorris.fact)
end