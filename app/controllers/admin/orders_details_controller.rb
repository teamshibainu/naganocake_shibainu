class Admin::OrdersDetailsController < ApplicationController
  #def index
    #@order_detail = OdersDetail.all
  #end

  #def show
    #@order_detail = OrdersDetail.find(params[:id])
  #end

  def update
    @order_details = OrdersDetail.find(params[:id])
    if @order_details.update(order_detail_params)
      redirect_to admins_orders_path(order), notice:"注文状況を変更しました。"
    else
      render "show"
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status) #:order_id, :product_id, :quantity, :price)
  end
end
