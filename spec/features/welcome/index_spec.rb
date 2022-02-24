require 'rails_helper'

RSpec.describe 'Landing Page' do
  it 'welcomes all visitors' do
    visit "/"

    expect(page).to have_content "Welcome to The Garden Manager"
  end
end
