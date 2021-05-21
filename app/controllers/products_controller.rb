class ProductsController < ApplicationController
  # before_action :technique_string,only: [:create,:update]
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
    @technique = Technique.all
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: '登録しました'
    else
      render :new
    end
  end
  def show
  @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, technique: [])
  end
  # def technique_string
  #   params[:product][:technique] = params[:product][:technique].join(",")
  # end
end
