require 'rails_helper'

RSpec.describe 'Users Dashboard' do
  it 'has a seven day forecast' do
    user = {
      'id' => '1',
      'attributes' => {
        'email' => 'user@example.com',
      }
    }
    visit '/dashboard'

    expect(page).to have_content('Weather Forecast')
    expect(page).to have_content('Low: 0.77°F')
    expect(page).to have_content('High: 24.6°F')
    expect(page).to have_content('Weather: snow')
  end
end
