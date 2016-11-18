class JourneyFare
attr_reader :price
MINIMUM_FARE = 1

  def initialize(minimum_fare = MINIMUM_FARE)
    @price = minimum_fare
  end

  def calculate_fare
    @price
  end


end
