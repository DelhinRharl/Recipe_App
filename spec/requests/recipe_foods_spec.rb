require 'rails_helper'

RSpec.describe "RecipeFoods", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/recipe_foods/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/recipe_foods/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/recipe_foods/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
