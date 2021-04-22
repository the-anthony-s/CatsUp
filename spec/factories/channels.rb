FactoryBot.define do
  factory :channel do
    name { Faker::Esport.league }
    user nil
  end
end
