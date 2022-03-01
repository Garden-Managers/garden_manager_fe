require 'rails_helper'

RSpec.describe GardenService do
  let(:service) { GardenService.new }
  describe '#get_frost_dates/1' do
    it 'returns a list of json frost dates' do
      response = File.read('spec/fixtures/frost_dates.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frostDates')
        .to_return({
                     status: 200,
                     body: response
                   })
      frost = service.get_frost_dates(1)
      expect(frost).to be_a Array
      expect(frost.first).to be_a Hash
      expect(frost.last).to be_a Hash
      expect(frost.first).to have_key(:season)
      expect(frost.first).to have_key(:temperature_threshold)
      expect(frost.first).to have_key(:prob_90)
      expect(frost.first[:season]).to be_a String
      expect(frost.first[:temperature_threshold]).to be_a String
      expect(frost.first[:prob_90]).to be_a String
    end
  end
  describe '#get_forecast/1' do
    it 'returns a list of json forecast dates' do
      response = File.read('spec/fixtures/forecast.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/forecast')
        .to_return({
                     status: 200,
                     body: response
                   })
      forecast = service.get_forecast(1)
      binding.pry
      expect(forecast).to be_a Hash
      expect(forecast[:weekly_forecast].first).to be_a Hash
      expect(forecast[:weekly_forecast].first).to have_key(:weather)
      expect(forecast[:weekly_forecast].first).to have_key(:dt)
      expect(forecast[:weekly_forecast].first).to have_key(:min)
      expect(forecast[:weekly_forecast].first).to have_key(:max)
      expect(forecast[:weekly_forecast].first[:dt]).to be_a String
      expect(forecast[:weekly_forecast].first[:min]).to be_a Float
      expect(forecast[:weekly_forecast].first[:max]).to be_a Float
      expect(forecast[:weekly_forecast].first[:weather]).to be_a String
    end
  end
  describe '#get_user/1' do
    it 'returns a json of a user' do
      response = File.read('spec/fixtures/user.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1')
        .to_return({
                     status: 200,
                     body: response
                   })
      user = service.get_user(1)
      expect(user).to be_a Hash
      expect(user[:data]).to be_a Hash
      expect(user[:data]).to have_key(:user_id)
      expect(user[:data][:attributes]).to have_key(:hardiness_zone)
      expect(user[:data][:user_id]).to be_a String
      expect(user[:data][:attributes][:hardiness_zone]).to be_a String
    end
  end
  describe '#get_user_plants/1' do
    it 'returns a json of a user plants' do
      response = File.read('spec/fixtures/plants.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/plants')
        .to_return({
                     status: 200,
                     body: response
                   })
      plants = service.get_user_plants(1)
      plant = plants[:data].first
      expect(plants).to be_a Hash
      expect(plants[:data]).to be_a Array
      expect(plant).to have_key(:id)
      expect(plant[:id]).to be_a(String)
      expect(plant).to have_key(:type)
      expect(plant[:type]).to eq('plant')
      expect(plant).to have_key(:attributes)
      expect(plant[:attributes]).to be_a(Hash)
      expect(plant[:attributes][:name]).to be_a(String)
      expect(plant[:attributes][:frost_date]).to be_a(Integer)
      expect(plant[:attributes][:maturity]).to be_a(Integer)
    end
  end
end
