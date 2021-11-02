class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_whether_correct_user, { only: %i[edit update destroy] }
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
    @products_ranks = Product.ranking
    @likes = Product.likes_counts
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

  def show; end

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

  # 他ユーザーのproductsを編集・削除できないように制限（管理者ユーザーは除く）
  def check_whether_correct_user
    @product = Product.find(params[:id])
    return true if current_user.admin == true || current_user.id == @product.user_id

    redirect_to product_path(@product), notice: '編集・削除権限がありません'
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def create_new_product
    @product = current_user.products.new(product_params)

    # チェックが入っているtechniquesを中間テーブルに保存
    used_technique_ids[:techniques].each do |used_technique_id|
      @product.product_techniques.build(technique_id: used_technique_id)
    end
    @product.save
  end

  def update_product
    @product.update(product_params)

    # 一度中間テーブルを削除
    @product.product_techniques.delete_all

    # 中間テーブルを再作成
    used_technique_ids[:techniques].each do |used_technique_id|
      @product.product_techniques.new(technique_id: used_technique_id)
    end
    @product.save
  end
end

def product_params
  params
    .require(:product)
    .permit(:name, :image, :image_cache, :remove_image, :url, :description)
end

#  チェックの入ったtechnique
def used_technique_ids
  params.require(:product).permit(techniques: [])
end
