class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :profile, length: { maximum: 250 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :products, dependent: :destroy
  has_many :likes

  def liked_by?(product_id)
    likes.where(product_id: product_id).exists?
  end
end
