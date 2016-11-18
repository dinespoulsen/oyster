require 'fare_calculator'

describe FareCalculator do

  subject(:fare_calculator) { described_class.new }

  it 'gives the price of a journey' do
    expect(fare_calculator.price).to eq FareCalculator::MINIMUM_FARE
  end

end
