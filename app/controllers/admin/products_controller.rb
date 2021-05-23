class Admin::ProductsController < ApplicationController
  before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  before_action :authenticate_admin!

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "新商品を登録しました"
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def index
    @products = Product.all.page(params[:page]).per(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "商品内容をを変更しました"
      redirect_to admin_product_path(@product)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image_id, :description,
       :genre_id, :price, :sale_status)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end

end
