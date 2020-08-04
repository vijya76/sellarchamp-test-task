class ProductsController < ApplicationController
  before_action :find_product, only: :show

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def show; end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      flash[:notice] = t('product.create.success')
      redirect_to products_path
    else
      flash[:error] = t('errors.messages.not_saved')
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :title, :description, :sku, :product_type_id,
      variants_attributes: [:sku, :price, :quantity, variant_options_attributes: [:id, :_destroy, :option_type, :option_value]]
    )
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path unless @product
  end
end
