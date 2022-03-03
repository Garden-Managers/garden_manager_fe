require 'rails_helper'

RSpec.describe 'Landing Page' do
  before(:each) do
    visit '/'
  end

  it 'welcomes all visitors' do
    expect(page).to have_content('Hi there! Please Login or Sign Up to see your garden dashboard.')
  end

  it 'has a link to log in' do
    expect(page).to have_link('Login')
  end

  it 'has a link to register new user' do
    expect(page).to have_link('Sign Up')
  end  
end
