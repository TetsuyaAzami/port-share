class Product < ApplicationRecord
  validates :name, presence: true
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :product_techniques, dependent: :destroy
  has_many :techniques, through: :product_techniques
end
