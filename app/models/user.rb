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
class User < ApplicationRecord
  # Relationships
  has_many :channels, counter_cache: true

  # check if name & email presents
  validates_presence_of :name, :email

  # scopes
  scope :default_order, -> { order(created_at: :asc) }
end
