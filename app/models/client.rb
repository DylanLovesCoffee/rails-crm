class Client < ApplicationRecord
  validates :company_name, :value, :user, presence: true
  validates :value, numericality: { only_integer: true }
  validates :company_name, uniqueness: true

  belongs_to :user
  has_many :comments
  has_many :contacts
end
