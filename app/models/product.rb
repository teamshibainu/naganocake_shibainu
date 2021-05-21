class Product < ApplicationRecord
  belongs_to :genre
	has_many :cart_products
	has_many :orders, through: :order_details
	has_many :order_details

	attachment :image_id

	validates :genre_id, :name, :price, presence: true
	validates :description, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }
end
