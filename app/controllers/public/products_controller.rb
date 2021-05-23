class Public::ProductsController < ApplicationController
  before_action :authenticate_member!, only: [:show]

	def index
    @genres = Genre.all
    @products = Product.where(sale_status: true).page(params[:page]).per(8)
	end

	def show
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_products = Cart_product.new
	end

  def about
  end

	private
	def product_params
		parmas.require(:product).permit(:image_id ,:name, :description, :price, :sale_status)
	end

end