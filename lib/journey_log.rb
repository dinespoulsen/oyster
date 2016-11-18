require_relative "journey.rb"

class JourneyLog
attr_accessor :journey

  def initialize
    @journey
  end

  def start(station, journey_klass = Journey)
    self.journey = journey_klass.new
    journey.save_entry(station)

  end


end
