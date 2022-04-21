require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/public_recipes'
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      get '/public_recipes'
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      get '/public_recipes'
      expect(response.body).to include('Public Recipes')
    end
  end
end
