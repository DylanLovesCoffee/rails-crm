class Contact < ApplicationRecord
  validates :name, :role, :email, :phone, :client, presence: true
  validates :decision_maker, inclusion: { in: [true, false] }

  belongs_to :client
end
