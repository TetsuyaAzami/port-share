class Product < ApplicationRecord
	validates :name,presence: true
	validates :language,presence: true
	mount_uploader :image,ImageUploader
end
