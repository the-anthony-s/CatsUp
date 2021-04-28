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
require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }

  it { is_expected.to have_many(:channels) }
  it { is_expected.to have_many(:messages) }
end
