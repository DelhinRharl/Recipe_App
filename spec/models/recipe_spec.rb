require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Recipe model' do
    before(:each) do
      @user = User.create name: 'Test user', email: 'test@example.com', password: 'password'
    end

    it 'name must not be blank' do
      recipe = Recipe.create name: '', cooking_time: 2, preparation_time: 10, description: 'Test description',
                             public: true, user: @user
      expect(recipe).to_not be_valid
    end
  end
end
