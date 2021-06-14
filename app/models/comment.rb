class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :support

  validates :body, presence: true
end
