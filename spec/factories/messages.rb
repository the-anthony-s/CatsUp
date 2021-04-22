FactoryBot.define do
  factory :message do
    message { Faker::ChuckNorris.fact }
    user nil
    channel nil
  end
end
