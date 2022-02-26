require 'rails_helper'

RSpec.describe HardinessZone do
  xit 'returns the hardiness zone for a given zipcode' do
    data = {
      'id' => '1',
      'attributes' => {
        'hardiness_zone' => '10b'
      }
    }
    info = HardinessZone.new(data)
    expect(info.zone).to eq '10b'
  end
end
