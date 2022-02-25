require 'rails_helper'

RSpec.describe GardenService do
  it "returns a hash of different endpoints" do
    service = GardenService.new

    expect(service.frost_dates).to be_a Hash
    expect(service.seven_day_forecast).to be_a Hash
    expect(service.hardiness_zone).to be_a Hash
  end
end 
