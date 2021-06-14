class Like < ApplicationRecord
  belongs_to :user
  belongs_to :support

  validates_uniqueness_of :support_id, scope: :user_id
end
