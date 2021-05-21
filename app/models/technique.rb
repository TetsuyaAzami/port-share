class Technique < ApplicationRecord
  has_many :product_carts
  has_many :products,through: :product_techniques
end
