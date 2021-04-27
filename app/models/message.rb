# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_messages_on_channel_id  (channel_id)
#  index_messages_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#  fk_rails_...  (user_id => users.id)
#
class Message < ApplicationRecord
  # Relationships
  belongs_to :user, counter_cache: true
  belongs_to :channel, counter_cache: true

  # check if message, channel, and user presence
  validates_presence_of :message, :user_id, :channel_id
end
