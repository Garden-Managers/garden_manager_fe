require 'rails_helper'

RSpec.describe Plant do
  let(:plant) { Plant.new({ id: '1', attributes: { name: 'Tomato', frost_date: 6, maturity: 72 } }) }
  describe 'initialize' do
    it 'exists' do
      actual = plant
      expected = Plant

      expect(actual).to be_a(expected)
    end
  end
  describe '#attributes' do
    it 'has a date' do
      actual = plant.id
      expected = '1'
      expect(actual).to eq(expected)
    end
    it 'has a low' do
      actual = plant.name
      expected = 'Tomato'
      expect(actual).to eq(expected)
    end
    it 'has a high' do
      actual = plant.frost_date
      expected = 6
      expect(actual).to eq(expected)
    end

    it 'has a weather' do
      actual = plant.maturity
      expected = 72
      expect(actual).to eq(expected)
    end
  end
end
