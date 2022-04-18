require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recipes/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/recipes/show'
      expect(response).to have_http_status(:success)
    end
  end
end
