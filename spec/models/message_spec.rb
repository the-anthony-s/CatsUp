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
require 'rails_helper'

RSpec.describe Message, type: :model do
  # Fields validation
  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:channel_id) }
  it { should validate_presence_of(:user_id) }

  # Relationships
  it { should belong_to(:user) }
  it { should belong_to(:channel) }
end
