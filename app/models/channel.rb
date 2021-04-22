class Channel < ApplicationRecord
  # Relationships
  has_many :messages, dependent: :destroy

  belongs_to :user, foreign_key: :user_id

  # check if name presence
  validates_presence_of :name
end
