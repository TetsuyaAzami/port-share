class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :url,
            format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/,
            presence: true,
            length: {
              maximum: 2000
            } # IEのURL最大長までに制限
  validates :description, length: { maximum: 250 }
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :product_techniques, dependent: :destroy
  has_many :techniques, through: :product_techniques
  has_many :likes, dependent: :destroy

  def self.ranking
    includes(:likes).sort { |a, b| b.likes.count <=> a.likes.count }
  end

  def self.likes_counts
    # Productのid番目が何個のlikeを持っているか知りたい
    likes_counts = {}
    # N+1問題対策
    products = includes(:likes)
    # {productのid,productに対するいいねの個数}
    products.each do |product|
      likes_counts.store(product.id, product.likes.count)
    end
    likes_counts
  end
end
