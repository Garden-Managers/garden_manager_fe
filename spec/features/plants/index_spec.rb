require 'rails_helper'

RSpec.describe 'Plants Index' do
  let(:user) { User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com', zip: '81007' } }) }
  it 'has a list of plants and their attributes' do
    response = File.read('spec/fixtures/plants.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants')
      .to_return({
                   status: 200,
                   body: response
                 })
    response = File.read('spec/fixtures/create_plant.json')
    stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants?frost_date=12&maturity=100&name=asparagus')
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
    response = File.read('spec/fixtures/create_user_plant.json')
    stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/user_plants?plant_id=1&user_id=1')
      .to_return({
                   status: 200,
                   body: response
                 })

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    visit plants_path

    within '#plants' do
      expect(page).to have_content('Plant: Tomato')
      expect(page).to have_content('Frost Date: 7')
      expect(page).to have_content('Maturity: 72')
      expect(page).to have_css('.plant-count', count: 40)
      expect(page).to have_link('Tomato')
      expect(page).to have_button('Add Plant!', count: 40)
      within '.plant-1' do
        click_button 'Add Plant!'
        expect(current_path).to eq(dashboard_path)
      end
    end
    expect(page).to have_content('Plant added to your garden!')
  end
  it 'has a form to add a plant' do
    response = File.read('spec/fixtures/plants.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants')
      .to_return({
                   status: 200,
                   body: response
                 })
    response = File.read('spec/fixtures/create_plant.json')
    stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants?frost_date=12&maturity=100&name=asparagus')
      .to_return({
                   status: 200,
                   body: response
                 })
    response = File.read('spec/fixtures/create_user_plant.json')
    stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/user_plants?plant_id=42&user_id=1')
      .to_return({
                   status: 200,
                   body: response
                 })

    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    visit plants_path

    within '.add-plant-form' do
      fill_in :name, with: 'asparagus'
      fill_in :maturity, with: '100'
      fill_in :frost_date, with: '12'

      click_on 'Add Plant'
    end
    expect(page).to have_content('asparagus successfully added!')
  end
  describe 'search plant form' do
    context 'when plant exisits' do
      it 'returns the plants that match the search field' do
        response = File.read('spec/fixtures/plants.json')
        stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants')
          .to_return({
                       status: 200,
                       body: response
                     })
        response = File.read('spec/fixtures/create_plant.json')
        stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants?frost_date=12&maturity=100&name=asparagus')
          .to_return({
                       status: 200,
                       body: response
                     })
        response = File.read('spec/fixtures/create_user_plant.json')
        stub_request(:post, 'https://ancient-basin-82077.herokuapp.com/api/v1/user_plants?plant_id=42&user_id=1')
          .to_return({
                       status: 200,
                       body: response
                     })
        response = File.read('spec/fixtures/search_plants.json')
        stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants/find?q=asparagus')
          .to_return({
                       status: 200,
                       body: response
                     })
        response = File.read('spec/fixtures/plant.json')
        stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants/42')
          .to_return({
                       status: 200,
                       body: response
                     })

        allow_any_instance_of(ApplicationController)
          .to receive(:current_user).and_return(user)
        visit plants_path
        within '.form-inline' do
          fill_in :search, with: 'asparagus'

          click_on 'Search!'
          expect(current_path).to eq(plants_path)
        end
        within '#plants' do
          expect(page).to have_content('Plant: asparagus')
          expect(page).to have_content('Frost Date: 100')
          expect(page).to have_content('Maturity: 12')
          expect(page).to have_css('.plant-count', count: 1)

          click_link 'asparagus'

          expect(current_path).to eq(plant_path(42))
        end
      end
    end
    
  describe 'when not a user' do
    it 'returns the visitor to the root path' do
      visit plants_path

      expect(current_path).to eq(root_path)
    end
  end
end
