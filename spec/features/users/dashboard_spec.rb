require 'rails_helper'

RSpec.describe 'Users Dashboard' do
  let(:user) { User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com', zip: '81007' } }) }
  let(:user_2) { User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com' } }) }
  it 'has a seven day forecast' do
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
    within '.weather' do
      expect(page).to have_content('Weather Forecast')
      expect(page).to have_content('Low: 33.57° F')
      expect(page).to have_content('High: 56.16° F')
      expect(page).to have_content('Weather: Clear')
    end
  end
  it 'has a users frost dates and hardiness_zone' do
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
    within '.frost-dates' do
      expect(page).to have_content('Fall frost date: May 31, temperature 36° F')
      expect(page).to have_content('Spring frost date: May 20, temperature 32° F')
    end
  end
  it 'has a users plants' do
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

    within '.plants' do
      expect(page).to have_content('My Plants!')
      expect(page).to have_content('Plant: Tomato')
      expect(page).to have_content('Frost Date: 7')
      expect(page).to have_content('Maturity: 72')
      expect(page).to have_content('Plant: Eggplant')
      expect(page).to have_css('.plant-count', count: 40)
    end
  end
  describe 'link to plants page' do
    it 'has a link to view plants' do
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
      within '.plants' do
        click_link 'Explore Plants' do
          expect(current_page).to eq(plants_path)
        end
      end
    end
  end
  describe 'Zip form' do
    it 'has a form to add zip code if the user hasnt added one yet' do
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
      response = File.read('spec/fixtures/update_user.json')

      stub_request(:patch, 'https://ancient-basin-82077.herokuapp.com/api/v1/users/1?zip=80223')
        .to_return({
                     status: 200,
                     body: response
                   })
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user_2)

      visit '/dashboard'

      within '.zip-form' do
        fill_in :zip, with: '80223'

        click_on 'Submit'
      end
      expect(current_path).to eq(dashboard_path)

      within '.success' do
        expect(page).to have_content('Zip has been added you can now get your forecast and frost dates!')
      end
    end
  end
end
