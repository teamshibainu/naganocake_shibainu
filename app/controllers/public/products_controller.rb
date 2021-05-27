class Public::ProductsController < ApplicationController
	def index
      @genres = Genre.all
      @products = Product.where(sale_status: true).page(params[:page]).per(8)
	end

	def show
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
	end

  def about
  end

	private
	def product_params
	  parmas.require(:product).permit(:image ,:name, :description, :price, :sale_status)
	end

end