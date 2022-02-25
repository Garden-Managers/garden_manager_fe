require 'rails_helper'

RSpec.describe GardenFacade do
  before :each do
    facade = GardenFacade.new
  end
  it '#frost_dates' do
    expect(facade.frost_dates).to be_a Hash
  end
  it '#hardiness_zone' do
    expect(facade.hardiness_zone).to be_a Hash
  end
  it '#seven_day_forecast' do
    expect(facade.seven_day_forecast).to be_a Array
  end
end 
