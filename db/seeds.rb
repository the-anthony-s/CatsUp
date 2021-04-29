30.times do
  User.create!(name: Faker::FunnyName.unique.name, email: Faker::Internet.unique.email)
end

u1 = User.first
u2 = User.second

u1.channels.create(name: Faker::Game.unique.title, recipient_id: u2.id)
u2.channels.create(name: Faker::Game.unique.title, recipient_id: u2.id)

c1 = Channel.first
c2 = Channel.second

c1.messages.create(user: u1, message: Faker::ChuckNorris.unique.fact)
c1.messages.create(user: u2, message: Faker::ChuckNorris.unique.fact)
c1.messages.create(user: u1, message: Faker::ChuckNorris.unique.fact)
c1.messages.create(user: u2, message: Faker::ChuckNorris.unique.fact)

c2.messages.create(user: u1, message: Faker::ChuckNorris.unique.fact)
c2.messages.create(user: u2, message: Faker::ChuckNorris.unique.fact)
c2.messages.create(user: u1, message: Faker::ChuckNorris.unique.fact)
c2.messages.create(user: u2, message: Faker::ChuckNorris.unique.fact)
