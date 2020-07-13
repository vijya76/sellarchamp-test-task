require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:product_type) { FactoryBot.create(:product_type) }
  let(:option) { FactoryBot.create(:option) }

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
      expect(product.variants.last.options.last).to eq(option)

      expect(response).to have_http_status(:redirect)
    end

    it 'should not create product and variants for invalid params' do
      expect { post :create, params: { product: { title: 'test' } } }.to change { Product.count }.by(0)

      expect(flash[:error]).to_not be_nil
    end
  end

  def params
    {
      product: { title: 'test', sku: 'test sku', product_type_id: product_type.id,
      variants_attributes: [{ sku: 'test sku v', price: 10, quantity: 10, option_ids: [option.id] }] }
    }
  end
end
