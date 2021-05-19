class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def update
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
