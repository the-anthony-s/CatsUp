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
require 'rails_helper'

RSpec.describe Channel, type: :model do
  # Fields validation
  it { should validate_presence_of(:name) }

  # Relationships
  it { should belong_to(:user) }
  it { should belong_to(:recipient) }
  it { should have_many(:messages).dependent(:destroy) }
end
