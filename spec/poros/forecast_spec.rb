require 'rails_helper'

RSpec.describe Forecast do
  let(:forecast) { Forecast.new({ dt: 'Sat, 26 Feb 2022', min: 0.77, max: 24.6, weather: 'snow' }) }
  describe 'initialize' do
    it 'exists' do
      actual = forecast
      expected = Forecast

      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a date' do
      actual = forecast.date
      expected = 'Sat, 26 Feb 2022'
      expect(actual).to eq(expected)
    end
    it 'has a low' do
      actual = forecast.low
      expected = 0.77
      expect(actual).to eq(expected)
    end
    it 'has a high' do
      actual = forecast.high
      expected = 24.6
      expect(actual).to eq(expected)
    end

    it 'has a weather' do
      actual = forecast.weather
      expected = 'snow'
      expect(actual).to eq(expected)
    end
  end
end
