class SupportedOptionsController < ApplicationController
  before_action :find_product_type

  def index
    supported_options = @product_type.product_options.pluck(:supported_option_type)

    render json: { supported_options: supported_options }
  end

  private

  def find_product_type
    @product_type = ProductType.find_by(id: params[:product_type_id])
    return render json: { error: t('errors.messages.not_found') }, status: 404 unless @product_type
  end
end
