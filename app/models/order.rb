class Order < ApplicationRecord
  belongs_to :user
  has_many :prodcts_id, dependent: :destroy #プロダクトid内の商品の削除
end
