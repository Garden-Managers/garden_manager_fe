require 'rails_helper'

RSpec.describe 'Landing Page' do
<<<<<<< HEAD
  it 'welcomes all visitors' do
    visit '/'

    expect(page).to have_content 'Welcome to The Garden Manager!'
  end
=======
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
>>>>>>> 0d5d03419c2df95467dcb808a895274f5fd03f51
end
