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

  describe '#find_user/1' do
    it 'creates a user' do
      response = File.read('spec/fixtures/user.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1')
        .to_return({
                     status: 200,
                     body: response
                   })
      user = facade.find_user(1)
      expect(user).to be_a User
    end
  end
end
