require 'rails_helper'

RSpec.describe OptionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:option) { FactoryBot.create(:option) }
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
  end

  describe 'GET #index' do
    it 'should return options for give type' do
      get :index, params: { type: option.option_type }
      expect(response).to have_http_status(:success)
      response_body = JSON.parse(response.body)

      expect(response_body['options'].first['id']).to eq(option.id)
    end
  end
end
