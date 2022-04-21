require 'rails_helper'

RSpec.describe 'Testing food views', type: :feature do
  describe 'Food#index' do
    before(:each) do
      user = User.create name: 'Test', email: 'test@example.com', password: 'password'
      (1..5).each { |i| user.foods.create name: "Test food #{i}", price: 10, measurement_unit: 'grams' }

      visit new_user_session_path
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
      click_on 'Log in'
      visit foods_path
    end

    it 'can see all the food' do
      expect(page).to have_content 'Test food 1'
      expect(page).to have_content 'Test food 2'
      expect(page).to have_content 'Test food 3'
      expect(page).to have_content 'Test food 4'
      expect(page).to have_content 'Test food 5'
    end

    it 'should be able to see delete buttons for each food' do
      within('table') do
        expect(find_all('button').length).to eq 5
      end
    end
  end
end
