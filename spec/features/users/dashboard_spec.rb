require 'rails_helper'

RSpec.describe 'Users Dashboard' do
  let(:user) { User.new({ user_id: '1', attributes: { hardiness_zone: '10b' } }) }
  it 'has a seven day forecast' do
    response = File.read('spec/fixtures/user.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1')
      .to_return({
                   status: 200,
                   body: response
                 })
    response = File.read('spec/fixtures/forecast.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/forecast')
      .to_return({
                   status: 200,
                   body: response
                 })
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    visit '/dashboard'
    within '.weather' do
      expect(page).to have_content('Weather Forecast')
      expect(page).to have_content('Low: 0.77° F')
      expect(page).to have_content('High: 24.6° F')
      expect(page).to have_content('Weather: snow')
    end
  end
end
