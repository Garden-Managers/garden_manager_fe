require 'rails_helper'

RSpec.describe User do
  let(:user) { User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com", zip: "81007", latitude: "39.1007", longitude: "-104.8542"} }) }
  describe 'initialize' do
    it 'exists' do
      actual = user
      expected = User

      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a user_id' do
      actual = user.user_id
      expected = '1'
      expect(actual).to eq(expected)
    end
  end
end
