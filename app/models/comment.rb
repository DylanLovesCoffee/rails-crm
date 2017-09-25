class Comment < ApplicationRecord
  validates :body, :client, presence: true

  belongs_to :client
end
