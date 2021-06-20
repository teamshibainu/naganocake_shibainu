class Public::CartProductsController < ApplicationController
  before_action :authenticate_member!
  def index
    @cart_products = CartProduct.all
    @total_price = @cart_products.sum{|cart_product|cart_product.product.price * cart_product.quantity * 1.10}
  end

# 商品一覧画面から、「商品購入」を押した時のアクション
  def create
    @product = Product.find(params[:cart_product][:product_id])
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.member_id = current_member.id
    @cart_products = current_member.cart_products.all
    @cart_products.each do |cart_product|
    if cart_product.product_id == @cart_product.product_id
      new_quantity = cart_product.quantity + @cart_product.quantity
      cart_product.update_attribute(:quantity, new_quantity)
      @cart_product.delete
    end
  end
    if @cart_product.save
      redirect_to public_cart_products_path
    else
      redirect_to request.referer
    end
  end

# カート詳細画面から、「更新」を押した時のアクション
  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
    redirect_to public_cart_products_path
  end

# カート詳細画面から、「削除」を押した時のアクション
  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to public_cart_products_path
  end

  def all_destroy
    @cart_products = CartProduct.all
    @cart_products.destroy_all
    redirect_to public_products_path
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id,:member_id,:quantity)
  end
end