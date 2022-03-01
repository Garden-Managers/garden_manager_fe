require 'rails_helper'

RSpec.describe 'Sessions Destroy' do
  let(:user) { User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } }) }
  it 'has a log out link on the dashboard' do
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
    response = File.read('spec/fixtures/frost_dates.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frostDates')
      .to_return({
                   status: 200,
                   body: response
                 })
    response = File.read('spec/fixtures/plants.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/plants')
      .to_return({
                   status: 200,
                   body: response
                 })
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    visit '/dashboard'

    expect(page).to have_link('Logout')
    click_on 'Logout'
    expect(current_path).to eq root_path
    expect(page).to have_link('Login')
  end
end
