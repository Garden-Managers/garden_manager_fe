require 'rails_helper'

RSpec.describe 'create a user' do 
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end 

    it 'can find/create a user' do 
      login_with_oath
      visit "/auth/google_oauth2"
      save_and_open_page
    # user: testing omniauth2 google rails
  end
end 