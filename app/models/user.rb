class User < ApplicationRecord
  validates :name, presence: true,length: {maximum: 50}
  validates :email ,presence: true
  validates :profile,length: {maximum: 250}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :products,dependent: :destroy
end

