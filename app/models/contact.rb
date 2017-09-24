class Contact < ApplicationRecord
  validates :name, :role, :email, :phone, :decision_maker, :client, presence: true
  validates :phone, numericality: { only_integer: true }

  belongs_to :client
end
