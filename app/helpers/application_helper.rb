module ApplicationHelper
  # 小数点切り捨てはfloor,３桁区切りはto_s(:delimited)
  # 税込の計算
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def sub_price(sub)
    (tax_price(sub.product.price) * sub.quantity)
  end

  # 合計金額の計算
  def total_price(totals)
    price = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
    return price
  end

  def final_price(order)
    price = total_price(order)
    price += 800
    return price
  end
  def total_quantity(quantity)
    quantity += quantity
  end
end