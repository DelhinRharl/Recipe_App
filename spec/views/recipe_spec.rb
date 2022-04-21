require 'rails_helper'

RSpec.describe 'Testing recipe views', type: :feature do
  describe 'Recipe#index' do
    before(:each) do
      user = User.create name: 'Test', email: 'test@example.com', password: 'password'
      (1..5).each do |i|
        user.recipes.create name: "Test recipe #{i}", preparation_time: 10, cooking_time: 10, description: 'Test',
                            public: true
      end

      visit new_user_session_path
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
      visit recipes_path
    end

    it 'can see all the recipes' do
      expect(page).to have_content 'Test recipe 1'
      expect(page).to have_content 'Test recipe 2'
      expect(page).to have_content 'Test recipe 3'
      expect(page).to have_content 'Test recipe 4'
      expect(page).to have_content 'Test recipe 5'
    end

    it 'should be able to see delete buttons for each recipe' do
      within('main') do
        expect(find_all('button').length).to eq 5
      end
    end

    it 'should lead to recipe details' do
      click_on 'Test recipe 1'
      expect(current_path).to eq recipe_path(Recipe.where(name: 'Test recipe 1').first.id)
      expect(current_path).to_not eq recipe_path(Recipe.where(name: 'Test recipe 2').first.id)
    end
  end
end
