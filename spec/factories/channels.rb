# == Schema Information
#
# Table name: channels
#
#  id             :bigint           not null, primary key
#  messages_count :integer          default(0)
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  recipient_id   :integer
#  user_id        :bigint
#
# Indexes
#
#  index_channels_on_name     (name)
#  index_channels_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (recipient_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :channel do
    name { Faker::Esport.league }
    user nil
    recipient nil
  end
end
