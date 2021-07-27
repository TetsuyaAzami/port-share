class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_whether_correct_user,{only:[:edit,:update,:destroy]}
  before_action :set_product,only: %i[show edit update destroy]

  def index
    @products = Product.all
    @products_ranks = Product.ranking
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
  end

  def edit
    @technique = Technique.all
  end

  def update
    if update_product
      redirect_to product_path(@product), notice: '編集完了しました'
    else
      @technique = Technique.all
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: '削除しました'
  end



  private

  def check_whether_correct_user #他ユーザーのproductsを編集・削除できないように制限（管理者ユーザーは除く）
    @product = Product.find(params[:id])
    unless current_user.admin == true || current_user.id == @product.user_id
    redirect_to product_path(@product),notice: "編集・削除権限がありません"
    end

  end

  def set_product
    @product = Product.find(params[:id])
  end


  def create_new_product
    @product = current_user.products.new(product_params)
    used_technique_ids[:techniques].each do |used_technique_id|
      @product.product_techniques.build(technique_id: used_technique_id)
    end
    @product.save
  end

  def update_product
      @product.update(product_params)
      @product.product_techniques.delete_all
      used_technique_ids[:techniques].each do |used_technique_id|
        @product.product_techniques.new(technique_id: used_technique_id)
      end
      @product.save
    end
end

def product_params
  params
  .require(:product)
  .permit(:name,:image, :image_cache, :remove_image, :url, :description)
end

def used_technique_ids
  params.require(:product).permit(techniques: [])
end
