class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, presence: true, uniqueness: {scope: :product}
  validates :product_id, presence: true, uniqueness: {scope: :user}
end
