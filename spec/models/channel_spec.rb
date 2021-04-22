require 'rails_helper'

RSpec.describe Channel, type: :model do
  # Fields validation
  it { should validate_presence_of(:name) }

  # Relationships
  it { should belong_to(:user) }
  it { should belong_to(:recipient) }
  it { should have_many(:messages).dependent(:destroy) }
end
