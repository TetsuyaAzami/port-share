class Product < ApplicationRecord
	validates :name,presence: true
	validates :language,presence: true
	validates :price,presence: true
end
