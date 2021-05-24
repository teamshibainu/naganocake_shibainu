class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def order_confirm
    @cart_poducts = current_cart
    @order = Order.new(member: current_member,payment_method: params[:order][:payment_method])
    @order.billing_amount = billing(@order)
    if params[:order][:street_address] == "residence"
      @order.postal_code = current_member.postal_code
      @order.street_address = current_member.residence
      @order.name = current_member.name
    elsif params[:order][:street_address] == "received"
      received = Receiveds.find(params[:order][addresse_id])
      @order.postal_code = received.postal_code
      @order.street_address = received.street_address
      @order.name = received.neme
    elsif params[:order][:street_addresses] == "new_street_address"
      @order.postal_code = params[:order][:postal_code]
      @order.street_address = params[:order][:street_address]
      @order.name        = params[:order][:name]
      @received = "1"

      # バリデーションがあるならエラーメッセージを表示
      unless @order.valid? == true
        @received = Receiveds.where(member: current_member)
        render :new
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def new
    @order = Order.new
    @addresses = Address.where(member: current_member)
  end

  def create
    @order = current_member.street_address.create(street_address_params)
    @order.save
    redirect_to thanx_members_path, notice:"注文が確定しました。"
    if params[:order][:received] == "1"
      current_member.street_address.create(street_address_params)
    end

    # カート商品の情報を注文商品に移動
    @cart_products = current_cart
    @cart_products.each do |cart_product|
      OrderDetail.create(product: cart_product.product, order:@order, quantity: cart_product.quantity, price: price(cart_product))
    end

    # 注文完了後、カート商品を空にする
    @cart_poducts.destroy_all
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :street_address, :name, :payment_method, :billing_amount)
  end

  def street_address_params
    params.require(:order).permit(:postal_code, :street_address, :name)
  end

  def to_order_confirm
    redirect_to member_cart_product_path
    if params[:id] == "log"
    end
  end
end
