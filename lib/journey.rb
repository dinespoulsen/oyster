class Journey
  attr_accessor :exit_station, :entry_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def entry_at(station)
    self.entry_station = station
  end

  def exit_at(station)
    self.exit_station = station
  end

  def fare
    return PENALTY_FARE if (entry_station == nil || exit_station == nil)
    MINIMUM_FARE
  end

end
