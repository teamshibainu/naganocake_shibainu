class Received < ApplicationRecord
  belongs_to :member

  validates :member_id, :name, :street_address, presence: true
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true }

  def order_address
    self.postal_code + self.address + self.name
  end
end

    #↓完成させたらschemaに追加
    #t.integer "postal_code"
    #t.string "prefecture_code"
    #t.string "city"
    #t.string "street"
