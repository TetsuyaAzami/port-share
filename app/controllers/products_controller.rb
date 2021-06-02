class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
    @technique = Technique.all
  end
  def create
    @product =
      Product.new(
        name: product_params[:name],
        description: product_params[:description],
        image: product_params[:image]
      )
    @product.user_id = current_user.id
    technique_ids = product_params[:techniques]
    technique_ids.each do |technique_id|
      @product.product_techniques.new(technique_id: technique_id.to_i)
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
