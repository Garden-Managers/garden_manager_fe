require 'rails_helper'

RSpec.describe 'create a user' do 
  before(:each) do
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end 

    it 'can find/create a user' do 
      visit "/auth/google_oauth2"
      visit dashboard_path
      
    # user: testing omniauth2 google rails
  end
end 