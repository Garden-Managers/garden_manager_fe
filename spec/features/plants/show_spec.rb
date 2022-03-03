require 'rails_helper'

RSpec.describe 'plants show page', type: :feature do
  let(:user) { User.new({ id: '1', attributes: { name: 'Raccoon22', email: 'happy22@example.com', zip: '81007' } }) }
  it 'has a plant a and its respective attributes' do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
    response = File.read('spec/fixtures/plants.json')
    stub_request(:get, 'https://ancient-basin-82077.herokuapp.com/api/v1/plants')
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

    visit plant_path(42)

    within '.plant' do
      expect(page).to have_content('Plant: asparagus')
      expect(page).to have_content('Maturity: 12')
      expect(page).to have_content('Frost Date: 100')
    end
  end
end
