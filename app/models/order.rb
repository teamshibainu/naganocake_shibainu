class Order < ApplicationRecord
  belongs_to :user
  has_many :prodcts_id, dependent: :destroy #プロダクトid内の商品の削除

  validates :public_id, :address,:name :postage,
  		  				  				  		:total_price, :payment_method,
  		  				  				  		presence: true
  validates :postal_code, length: {is: 7}, numricality: { only_integer: true }
  validates :postage, :total_price, numricality: { only_integer: true }

  enum payment_method: {"クレジットカード" 0,"銀行振込": 1}
  enum order_status: {"入金待ち": 0,"入金確認": 1,"制作中": 2,"発送準備中": 3, "発送済み": 4}

end
