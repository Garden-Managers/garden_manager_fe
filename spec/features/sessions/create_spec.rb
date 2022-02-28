require 'rails_helper'

RSpec.describe 'create a user' do
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

    it 'can find/create a user' do
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
      visit "/auth/google_oauth2"
      expect(current_page).to eq '/dashboard'
    # user: testing omniauth2 google rails
  end
end
