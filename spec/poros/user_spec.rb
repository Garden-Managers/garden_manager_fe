require 'rails_helper'

RSpec.describe User do
  let(:user) { User.new({ user_id: '1', attributes: { hardiness_zone: '10b'} }) }
  describe 'initialize' do
    it 'exists' do
      actual = user
      expected = User

      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a hardiness zone' do
      actual = user.hardiness_zone
      expected = '10b'
      expect(actual).to eq(expected)
    end
    it 'has a user_id' do
      actual = user.user_id
      expected = '1'
      expect(actual).to eq(expected)
    end
  end
end
