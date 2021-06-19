class Product < ApplicationRecord
  validates :name, presence: true,length: {maximum: 50}
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
  validates :description,length: {maximum: 250}
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :product_techniques, dependent: :destroy
  has_many :techniques, through: :product_techniques


end
