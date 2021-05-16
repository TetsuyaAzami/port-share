class Product < ApplicationRecord
	validates :name,presence: true
	validates :language,presence: true
	validates :image,presence: true
end
