class CartProduct < ApplicationRecord
  belongs_to :member
  belongs_to :product

  validates :quantity, inclusion: { in: [1,2,3,4,5,6,7,8,9,10] }
end
