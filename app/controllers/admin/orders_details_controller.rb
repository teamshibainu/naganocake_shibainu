class Admin::OrdersDetailsController < ApplicationController

  def update
    @order_details = OrdersDetail.find(params[:id])
    if @order_details.update(order_detail_params)
      redirect_to admin_order_path(@order_details.id), notice:"制作ステータスを変更しました。"
    else
      render "show"
    end
  end

  private
  def order_detail_params
    params.require(:orders_detail).permit(:production_status)
  end
end
