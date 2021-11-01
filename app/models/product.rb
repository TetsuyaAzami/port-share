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
    # 空のハッシュを定義
    likes_counts = {}

    # likes_counts[:product.id] = product.likes.count
    products = self.includes(:likes)
    products.each do |product|
      # binding.pry
      likes_counts.store(product.id, product.likes.count)
    end
    likes_counts

    # # いいねの数の配列
    # likes_counts = []
    # # N+1問題対策
    # products = self.includes(:likes)
    # products.each { |product| likes_counts.push(product.likes.count) }
    # # binding.pry
    # likes_counts
  end
end
