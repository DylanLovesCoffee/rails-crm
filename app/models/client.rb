class Client < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :contacts
end
