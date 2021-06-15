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
    if create_new_product
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
    @technique = Technique.all
  end

  def update
    @product = Product.find(params[:id])
    if update_product
      redirect_to product_path(@product), notice: "編集完了しました"
    else
      @technique = Technique.all
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: '削除しました'
  end



  def create_new_product
    @product =
      current_user.products.new(
        name: product_params[:name],
        description: product_params[:description],
        image: product_params[:image]
      )
    used_technique_ids = product_params[:techniques]
    used_technique_ids.each do |used_technique_id|
      @product.product_techniques.build(technique_id: used_technique_id)
    end
    @product.save
  end

  def update_product
    ActiveRecord::Base.transaction do
      @product.update(
        name: product_params[:name],
        description: product_params[:description],
        image: product_params[:image]
      )
      used_technique_ids = product_params[:techniques]
      @product.product_techniques.delete_all
      used_technique_ids.each do |used_technique_id|
        @product.product_techniques.create(technique_id: used_technique_id)
      end
    end
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
