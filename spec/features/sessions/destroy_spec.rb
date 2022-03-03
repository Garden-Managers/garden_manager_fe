require 'rails_helper'

RSpec.describe 'Sessions Destroy' do
  before(:each) do
    user = User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } })

    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
      response = File.read('spec/fixtures/no_find_user.json')
      stub_request(:get, "https://ancient-basin-82077.herokuapp.com/api/v1/user?email=happy22@example.com")
        .to_return({
                     status: 200,
                     body: response
                   })

    response = File.read('spec/fixtures/create_user.json')
    stub_request(:post, "https://ancient-basin-82077.herokuapp.com/api/v1/users?email=happy22@example.com&name=Raccoon22")
      .to_return({
                   status: 200,
                   body: response
                 })

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

    visit root_path
  end

  it 'can log out' do
    expect(page).to have_link('Log Out')
    expect(page).to_not have_link('Login')
    expect(page).to_not have_link('Sign Up')
    click_on 'Log Out'
    expect(current_path).to eq(root_path)
  end
end
