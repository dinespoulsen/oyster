class FareCalculator

  attr_reader :price

  MINIMUM_FARE = 1

  def initialize(price = MINIMUM_FARE)
    @price = price
  end

end
