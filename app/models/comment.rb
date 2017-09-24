class Comment < ApplicationRecord
  validates :text, :client, presence: true

  belongs_to :client
end
