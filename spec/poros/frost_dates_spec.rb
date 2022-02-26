require 'rails_helper'

RSpec.describe FrostDate do
  let(:frost) { FrostDate.new({ season: 'fall', temperature_threshold: '36', prob_90: '0531' }) }
  describe 'initialize' do
    it 'exists' do
      actual = frost
      expected = FrostDate

      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a season' do
      actual = frost.season
      expected = 'fall'
      expect(actual).to eq(expected)
    end

    it 'has a temperature_threshold' do
      actual = frost.temperature_threshold
      expected = '36'
      expect(actual).to eq(expected)
    end
    it 'has a date' do
      actual = frost.date
      expected = '0531'
      expect(actual).to eq(expected)
    end
  end
end
