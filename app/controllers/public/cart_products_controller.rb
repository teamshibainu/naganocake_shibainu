class CartProductsController < ApplicationController
  before_action :cart_product_params, only: [:create, :update, :destroy]

  def index
    @cart_products = current_cart.cart_items
  end

# 商品一覧画面から、「商品購入」を押した時のアクション
  def create
    if @cart_product.blank?
      @cart_product = current_cart.cart_items.build(product_id: params[:product_id])
    end

    @cart_product.quantity += params[:quantity].to_i
    @cart_product.save
    redirect_to public_cart_products_path
  end

# カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_product.update(quantity: params[:quantity].to_i)
    redirect_to public_cart_products_path
  end

# カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_product.destroy
    redirect_to public_cart_products_path
  end

  def all_destroy
    @cart_products.destroy
    redirect_to public_cart_products_path
  end

  private

  def cart_product_params
    params.require(:product_id).parmit(:member_id, :product_id, :quantity)
  end
end
