module ProductsHelper
  def used_product_techniques
    product = Product.find(params[:id])
    product.technique_ids
  end

end
