class Customer::ProductsController < ApplicationController

  before_action :authenticate_customer!, only: [:show]

  def top
    @products = Product.all.order(created_at: :asc)
    @genres = Genre.all
  end

	def index
    @genres = Genre.all
    @products = Product.where(sale_status: true).page(params[:page]).per(8)
	end

	def show
    @products = Product.all
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
	end

  def about
  end

	private
	def product_params
		parmas.require(:product).permit(:image ,:name, :description, :price, :sale_status)
	end

end