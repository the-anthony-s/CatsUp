class Message < ApplicationRecord
  # Relationships
  belongs_to :user
  belongs_to :channel

  # check if message, channel, and user presence
  validates_presence_of :message, :user_id, :channel_id
end
