class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_details = OrdersDetail.where(order_id: @orders)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrdersDetail.where(order_id: @order.id)
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to request.referer, notice:"注文ステータスを変更しました。"
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
