require 'rails_helper'

RSpec.describe GardenFacade do
  describe '#frost_dates' do
    it '#returns a frost date poros/1' do
      response = File.read('spec/fixtures/frost_dates.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frost_dates')
        .to_return({
                     status: 200,
                     body: response
                   })
      expect(GardenFacade.frost_dates('1').first).to be_a FrostDate
      expect(GardenFacade.frost_dates('1').last).to be_a FrostDate
      expect(GardenFacade.frost_dates('1').count).to eq(2)
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
      forecast = GardenFacade.forecast(1).first
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
      user = GardenFacade.find_user(1)
      expect(user).to be_a User
    end
  end
  describe '#plant/1' do
    it 'creates plant objects from users plants' do
      response = File.read('spec/fixtures/plants.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/plants')
        .to_return({
                     status: 200,
                     body: response
                   })
      GardenFacade.plants(1).each do |plant|
        expect(plant).to be_a Plant
      end
    end
  end
  describe '#update' do
    it 'updates a user poro' do
      response = File.read('spec/fixtures/update_user.json')
      stub_request(:patch, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1?zip=80223')
        .to_return({
                     status: 200,
                     body: response
                   })
      user = GardenFacade.update_user('80223')
      expect(user).to be_a User
    end
  end
  describe '#all_plants' do
    it 'returns all Plant Poros' do
      response = File.read('spec/fixtures/plants.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants')
        .to_return({
                     status: 200,
                     body: response
                   })

      GardenFacade.all_plants.each do |plant|
        expect(plant).to be_a Plant
      end
    end
  end
  describe '#add_plant' do
    it 'returns a plant poro' do
      response = File.read('spec/fixtures/create_plant.json')
      stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants?frost_date=12&maturity=100&name=asparagus')
        .to_return({
                     status: 200,
                     body: response
                   })
      plant = GardenFacade.add_plant({ name: 'asparagus', frost_date: '12', maturity: '100' })
      expect(plant).to be_a Plant
    end
  end
  describe '#search_plants' do
    it 'returns a plant poro' do
      response = File.read('spec/fixtures/search_plants.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants/find?q=asparagus')
        .to_return({
                     status: 200,
                     body: response
                   })
      plant = GardenFacade.search_plants('asparagus').first
      expect(plant).to be_a Plant
    end
  end
end
