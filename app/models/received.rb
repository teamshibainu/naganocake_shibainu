class Received < ApplicationRecord
  belongs_to :member

  def order_address
    self.postal_code + self.address + self.name
  end
end

    #↓完成させたらschemaに追加
    #t.integer "postal_code"
    #t.string "prefecture_code"
    #t.string "city"
    #t.string "street"
