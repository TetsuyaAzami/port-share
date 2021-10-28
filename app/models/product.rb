class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/
  validates :description, length: { maximum: 250 }
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :product_techniques, dependent: :destroy
  has_many :techniques, through: :product_techniques
  has_many :likes

  def self.ranking
    includes(:likes).sort { |a, b| b.likes.count <=> a.likes.count }
  end
end
