require 'rails_helper'

RSpec.describe GardenFacade do
  let(:facade) { GardenFacade.new }
  describe '#frost_dates' do
    it '#returns a frost date poros/1' do
      response = File.read('spec/fixtures/frost_dates.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frostDates')
        .to_return({
                     status: 200,
                     body: response
                   })
      expect(facade.frost_dates('1').first).to be_a FrostDate
      expect(facade.frost_dates('1').last).to be_a FrostDate
      expect(facade.frost_dates('1').count).to eq(2)
    end
  end
  describe '#HardinessZone/1' do
    xit 'returns a hardiness zone poro' do
      expect(facade.hardiness_zone(80_234)).to be_a Hash
    end
  end
  describe '#forecast/1' do
    it '#forecast' do
      response = File.read('spec/fixtures/forecast.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/forecast')
        .to_return({
                     status: 200,
                     body: response
                   })
      forecast = facade.forecast(1).first
      expect(forecast).to be_a Forecast
    end
  end
end
