class User < ApplicationRecord
  validates :first_name, :last_name, :company, :email, :password_digest, presence: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true

  has_many :clients
  has_secure_password
end
