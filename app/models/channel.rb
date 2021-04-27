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
class Channel < ApplicationRecord
  # Relationships
  has_many :messages, dependent: :destroy

  belongs_to :user, foreign_key: :user_id
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  # check if name presence
  validates_presence_of :name
end
