require 'rails_helper'

RSpec.describe SupportedOptionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:product_type) { FactoryBot.create(:product_type) }
  let!(:product_option) { FactoryBot.create(:product_option, product_type: product_type) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
  end

  describe 'GET #index' do
    it 'should return supported options' do
      get :index, params: { product_type_id: product_type.id }
      expect(response).to have_http_status(:success)
      response_body = JSON.parse(response.body)

      expect(response_body['supported_options']).to eq([product_option.supported_option_type])
    end

    it 'should return error for invalid product_type' do
      get :index, params: { product_type_id: 'invalid' }
      expect(response).to have_http_status(404)
    end
  end
end
