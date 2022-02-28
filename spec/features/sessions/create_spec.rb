require 'rails_helper'

RSpec.describe 'create a user' do 
  it 'can find/create a user' do 
    visit "/"
    click_on "Sign Up"

    # user: testing omniauth2 google rails
  end
end 