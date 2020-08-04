require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:product_type) { FactoryBot.create(:product_type) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
  end

  describe 'GET #index' do
    it 'should take user to index page' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'should create product with variants for valid params' do
      expect { post :create, params: params }.to change { Product.count }.by(1)
      product = Product.last

      expect(flash[:notice]).to eq(I18n.t('product.create.success'))
      expect(product.product_type).to eq(product_type)
      expect(product.variants.count).to eq(1)

      expect(response).to have_http_status(:redirect)
    end

    it 'should not create product with variants for duplicate options' do
      expect { post :create, params: invalid_params }.to change { Product.count }.by(0)

      expect(flash[:error]).to eq(I18n.t('errors.messages.not_saved'))
      expect(response).to render_template :new
    end

    it 'should not create product with variants for dissimilar options' do
      expect { post :create, params: dissimilar_option_params }.to change { Product.count }.by(0)

      expect(flash[:error]).to eq(I18n.t('errors.messages.not_saved'))
      expect(response).to render_template :new
    end

    it 'should not create product and variants for invalid params' do
      expect { post :create, params: { product: { sku: 'AXC' } } }.to change { Product.count }.by(0)

      expect(flash[:error]).to_not be_nil
    end
  end

  def params
    {
      product: { title: 'test', sku: 'test sku', product_type_id: product_type.id,
      variants_attributes: [{ sku: 'test sku v', price: 10, quantity: 10, variant_options_attributes: [{option_type: 'color', option_value: 'red'}] }] }
    }
  end

  def invalid_params
    {
      product: { title: 'test product', sku: 'UWX', product_type_id: product_type.id,
      variants_attributes: [{ sku: 'KUI', price: 10, quantity: 10, variant_options_attributes: [{option_type: 'color', option_value: 'red'}, {option_type: 'color', option_value: 'red'}] }] }
    }
  end

  def dissimilar_option_params
    {
      product: { title: 'test product', sku: 'UWX', product_type_id: product_type.id,
      variants_attributes: [{ sku: 'KUI', price: 10, quantity: 10, variant_options_attributes: [{option_type: 'color', option_value: 'red'}, {option_type: 'size', option_value: 'L'}] },
                            { sku: 'LVC', price: 90, quantity: 12, variant_options_attributes: [{option_type: 'color', option_value: 'red'}, {option_type: 'fabric', option_value: 'cotton'}] }]}
    }
  end
end
