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
