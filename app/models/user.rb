class User < ApplicationRecord
  # Relationships
  has_many :channels, foreign_key: :user_id

  # check if name & email presents
  validates_presence_of :name, :email
end
