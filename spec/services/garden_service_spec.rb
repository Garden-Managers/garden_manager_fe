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
      expect(forecast).to be_a Hash
      expect(forecast[:daily].first).to be_a Hash
      expect(forecast[:daily].first).to have_key(:weather)
      expect(forecast[:daily].first).to have_key(:dt)
      expect(forecast[:daily].first).to have_key(:min)
      expect(forecast[:daily].first).to have_key(:max)
      expect(forecast[:daily].first[:dt]).to be_a String
      expect(forecast[:daily].first[:min]).to be_a Float
      expect(forecast[:daily].first[:max]).to be_a Float
      expect(forecast[:daily].first[:weather]).to be_a String
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
  describe '#create_user' do
    it 'returns a json of a new user' do
      response = File.read('spec/fixtures/create_user.json')
      stub_request(:post, "https://ancient-basin-82077.herokuapp.com/api/v1/users?email=happy22@example.com&name=Raccoon22")
        .to_return({
                     status: 200,
                     body: response
                   })
      user = service.create_user("happy22@example.com", "Raccoon22")
      expect(user).to be_a Hash
      expect(user[:data]).to be_a Hash
      expect(user[:data][:id]).to be_a String
      expect(user[:data][:attributes][:name]).to be_a String
      expect(user[:data][:attributes][:email]).to be_a String
    end
  end
end
