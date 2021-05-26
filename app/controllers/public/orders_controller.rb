class Public::OrdersController < ApplicationController
  include ApplicationHelper
  def index
    @orders = Order.all
  end

  def order_confirm
    @cart_products = current_member.cart_products
    @order = Order.new(member: current_member,payment_method: params[:order][:payment_method])
    @order.billing_amount = current_member.cart_products.joins(:product).sum("products.price*quantity*1.1")+800
    if params[:order][:addresses] == "residence"
      @order.postal_code = current_member.postal_code
      @order.street_address = current_member.address
      @order.name = current_member.last_name + current_member.first_name
    elsif params[:order][:addresses] == "received"
      received = Receiveds.find(params[:order][addresse_id])
      @order.postal_code = received.postal_code
      @order.street_address = received.street_address
      @order.name = received.neme
    elsif params[:order][:addresses] == "new_street_address"
      @order.postal_code = params[:order][:postal_code]
      @order.street_address = params[:order][:street_address]
      @order.name = params[:order][:name]
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
    @receiveds = Received.where(member: current_member)
  end

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @order.save
    if params[:order][:received] == "1"
      current_member.address.new(order_params)
    end

    # カート商品の情報を注文商品に移動
    @cart_products = current_member.cart_products
    @cart_products.each do |cart_product|
      @order_details = OrdersDetail.new
      @order_details.product_id = cart_product.product_id
      @order_details.order_id = @order.id
      @order_details.quantity = cart_product.quantity
      @order_details.price = cart_product.product.price
      @order_details.production_status = 0
      if @order_details.save
        redirect_to public_complete_path
        @cart_products.destroy_all
      else
        render "order_confirm"
      end
    end
    # 注文完了後、カート商品を空にする
    #redirect_to public_complete_path, notice:"注文が確定しました。"
    #@cart_products.destroy_all
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :street_address, :name, :payment_method, :billing_amount, :shipping_cost, :status)
  end

  def to_order_confirm
    redirect_to member_cart_product_path
    if params[:id] == "log"
    end
  end
end
