require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Food model' do
    @user = User.create(name: 'Affax', email: 'toast@example.com', password: '123456')
    subject { Food.new(user_id: @user, name: 'Tomato', measurement_unit: 'g', price: 12) }
    before { subject.save }

    it 'checks if name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check that the measurement_unit is not blank' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'checks that the price is not empty' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end