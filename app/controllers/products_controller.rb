class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @technique = Technique.all
  end

  def create
    @product =
      current_user.products.build(
        name: product_params[:name],
        description: product_params[:description],
        image: product_params[:image]
      )
    technique_ids = product_params[:techniques]
    technique_ids.each do |technique_id|
      @product.product_techniques.build(technique_id: technique_id.to_i)
    end
    if @product.save
      redirect_to products_path, notice: '登録しました'
    else
      @technique = Technique.all
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    binding.pry
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path,notice: "削除しました"
  end

  private

  def product_params
    params
      .require(:product)
      .permit(
        :name,
        :description,
        :image,
        :image_cache,
        :remove_image,
        techniques: []
      )
  end
end
