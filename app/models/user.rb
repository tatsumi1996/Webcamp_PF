class User < ApplicationRecord
  validates :nickname, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  
  attachment :profile_image, destroy: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :supports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  #belongs_to :favorite_team
  
  attribute :is_deleted, :boolean, default: false
  
  def status_name
    name = {true => "退会", false => "有効"}
    return name[self.is_deleted]
  end
  
  def already_liked?(support)
    self.likes.exists?(support_id: support.id)
  end
  
end
