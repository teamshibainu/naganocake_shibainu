class Order < ApplicationRecord
  belongs_to :member
  has_many :prodcts_id, dependent: :destroy #プロダクトid内の商品の削除

  validates :orders_details_id, :street_address, :name, :postage, :total_price, :payment_method, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :postage, :total_price, numericality: { only_integer: true }

  enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
  enum status: {waiting: 0,paid_up: 1,preparing: 2,shipped: 3}

end
