require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET foods#index' do
    before(:each) do
      user = User.create name: 'foodie', email: 'f@example.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get foods_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('Foods')
    end

    it 'creates food' do
      expect do
        post foods_path, params: { food: { name: 'foodie', price: '1.00', unit: 'kg' } }
      end.to change(Food, :count).by(1)
    end

    it 'creates food with correct attributes' do
      post foods_path, params: { food: { name: 'foodie', price: '1.00', measurement_unit: 'kg' } }
      expect(Food.last.name).to eq('foodie')
      expect(Food.last.price).to eq(1.00)
      expect(Food.last.measurement_unit).to eq('kg')
    end

    it 'creates food and returns to foods page' do
      post foods_path, params: { food: { name: 'foodie', price: '1.00', measurement_unit: 'kg' } }
      expect(response).to redirect_to(foods_path)
    end
  end
end
