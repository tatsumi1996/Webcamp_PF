class FavoriteTeam < ApplicationRecord
  attachment :image, destroy: false
  has_many :users
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true, presence: true
end
