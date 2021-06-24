class Support < ApplicationRecord
  acts_as_taggable
  
  validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }
  
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  belongs_to :user
  
  def self.search(keyword)
    where(["title like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
end
