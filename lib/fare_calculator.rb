class FareCalculator

  attr_accessor :zones, :price

  MINIMUM_FARE = 1
  ZONE_PRICE = 1

  def initialize(price = MINIMUM_FARE)
    @price = price
    @zones
  end

  def zones_travelled(zone_entry, zone_exit)
    self.zones = (zone_entry - zone_exit).abs
  end

  def calculate_price
    self.price = zones * ZONE_PRICE
  end

end
