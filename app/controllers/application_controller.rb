class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?


    protected

    def check_whether_product_producer
      @product = Product.find(params[:id])
      unless current_user.admin == true || current_user.id === @product.user_id
      redirect_to product_path(@product),notice: "編集・削除権限がありません"
      end

    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

  end
end
