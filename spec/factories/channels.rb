FactoryBot.define do
  factory :channel do
    name { Faker::Esport.league }
    user nil
    recipient nil
  end
end
