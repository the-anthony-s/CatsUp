# == Schema Information
#
# Table name: users
#
#  id             :bigint           not null, primary key
#  channels_count :integer          default(0)
#  email          :string
#  messages_count :integer          default(0)
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#  index_users_on_name   (name)
#
FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email }
  end
end
