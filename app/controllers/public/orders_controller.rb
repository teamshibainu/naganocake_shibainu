class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
  
  def new
  end
  
  def order_confirm
  end
  
  def create
  end
  
  def complete
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_price)
  end
end
