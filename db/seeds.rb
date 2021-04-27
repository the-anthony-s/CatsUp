# Create 750 fake users
# 750 names is the limit for Faker gem
# rand(..) - used as a simple replacement of a random ID value
750.times do
  name = Faker::FunnyName.unique.name
  email = Faker::Internet.unique.email

  User.create(name: name, email: email)
end

300.times do
  Channel.create(user_id: rand(1..750), recipient_id: rand(1..750), name: Faker::Game.title)
end

2000.times do
  Message.create(user_id: rand(1..750), channel_id: rand(1..300), message: Faker::ChuckNorris.fact)
end