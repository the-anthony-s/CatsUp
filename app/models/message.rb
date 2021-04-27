class Message < ApplicationRecord
  # Relationships
  belongs_to :user, counter_cache: true
  belongs_to :channel, counter_cache: true

  # check if message, channel, and user presence
  validates_presence_of :message, :user_id, :channel_id
end
