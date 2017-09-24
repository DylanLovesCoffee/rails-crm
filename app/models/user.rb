class User < ApplicationRecord
  validates :first_name, :last_name, :company, :email, :password_digest, presence: true
  validates :password_digest, length: { minimum: 6 }
  validates :email, uniqueness: true

  has_many :clients
  has_secure_password
end
