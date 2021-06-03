class Technique < ApplicationRecord
  has_many :product_techniques,dependent: :destroy
  has_many :products,through: :product_techniques
end
