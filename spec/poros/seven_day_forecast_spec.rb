require 'rails_helper'

RSpec.describe SevenDayForecast do
  it "returns the min and max temperatures for the day as well as the type of weather" do
    data = {
      'id' => '1',
      'attributes' => {
        'min_temp' => '62',
        'max_temp' => '88',
        'weather_type' => 'Rain'
      }
    }
    info = SevenDayForecast.new(data)
    expect(info.low).to eq "62"
    expect(info.high).to eq "88"
    expect(info.weather_type).to eq "Rain"
  end
end 
