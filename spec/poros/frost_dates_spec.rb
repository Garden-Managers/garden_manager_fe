require 'rails_helper'

RSpec.describe FrostDates do
  it "returns frost dates for the spring and fall" do
    data = {
      'id' => '1',
      'attributes' => {
        'spring_frost' => '0506',
        'fall_frost' => '0906'
      }
    }
    info = FrostDates.new(data)
    expect(info.spring).to eq "0506"
    expect(info.fall).to eq "0906"
  end
end
