class User < ApplicationRecord
  # check if name & email presents
  validates_presence_of :name, :email
end
