class Order < ApplicationRecord
  belongs_to :member
  has_many :orders_details, dependent: :destroy #プロダクトid内の商品の削除

  validates :street_address, :name, :postal_code, :billing_amount, :payment_method, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }
  validates :postal_code, :billing_amount, numericality: { only_integer: true }

  enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
  enum status: {支払待ち: 0,支払済み: 1,発送準備中: 2,発送済み: 3}

end
