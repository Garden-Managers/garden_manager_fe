require 'rails_helper'

RSpec.describe 'Users Dashboard' do

  let(:user) { User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com', zip: '81007' } }) }
  let(:user_2) { User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com' } }) }

  before(:each) do
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
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frost_dates')
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
  end

  it 'has a seven day forecast' do
    within '#weather' do
      expect(page).to have_content('Low: 33.57° F')
      expect(page).to have_content('High: 56.16° F')
      expect(page).to have_content('Weather: Clear')
    end
  end

  it 'has a users frost dates and hardiness_zone' do
    within '#frost-dates' do
      expect(page).to have_content('Fall frost date: May 31, temperature 36° F')
      expect(page).to have_content('Spring frost date: May 20, temperature 32° F')
    end
  end

  it 'has a users plants' do
    within '#plants' do
      expect(page).to have_content('My Plants')
      expect(page).to have_content('Tomato')
      expect(page).to have_content('Safe planting time from frost date: 7')
      expect(page).to have_content('Days to maturity: 72')
      expect(page).to have_content('Eggplant')
      expect(page).to have_content('40 plants in your collection')
    end
  end
  describe 'link to plants page' do
    it 'has a link to view plants' do
      user = User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com', zip: '81007' } })
      user_2 = User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com' } })
      response = File.read('spec/fixtures/forecast.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/forecast')
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
      response = File.read('spec/fixtures/frost_dates.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frost_dates')
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
      response = File.read('spec/fixtures/plants.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants')
        .to_return({
                     status: 200,
                     body: response
                   })
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)
      visit '/dashboard'
      click_link 'Plant Library' do
      expect(current_page).to eq(plants_path)
      end
    end
  end
  describe 'Zip form' do
    it 'has a form to add zip code if the user hasnt added one yet' do
      user = User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com', zip: '81007' } })
      user_2 = User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com' } })
      response = File.read('spec/fixtures/forecast.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/forecast')
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
      response = File.read('spec/fixtures/frost_dates.json')
      stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1/frost_dates')
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
      response = File.read('spec/fixtures/update_user.json')

      stub_request(:patch, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1?zip=80223')
        .to_return({
                     status: 200,
                     body: response
                   })
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user_2)

      visit '/dashboard'

      within '#zip-form' do
        fill_in :zip, with: '80223'

        click_on 'Submit'
      end
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Success! You can now see your local weather and planting data.')

    end
  end
  describe 'Not a user' do
    it 'returns visitor to root path' do
      visit dashboard_path

      expect(current_path).to eq(root_path)
    end
  end
end
