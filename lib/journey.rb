require './lib/oyster.rb'

class Journey

attr_reader :entry_station, :exit_station, :complete_journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def save_entry(station)
    @entry_station = station
  end

  def save_exit(station)
    @exit_station = station
  end

  def fare
    return PENALTY_FARE if entry_station.nil? || exit_station.nil?
    MINIMUM_FARE
  end

end
