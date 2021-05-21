class ProductTechnique < ApplicationRecord
  belongs_to :product
  belongs_to :technique
end
