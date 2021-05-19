class OrdersDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :prodcts_id, :order_id, :quantity, :subprice, presence: true
  validates :subprice, :quantity, numericality: { only_integer: true }

  enum production_status: {"着手不可": 0,"制作待ち": 1,"作成中": 2,"制作完了": 3 }
end
