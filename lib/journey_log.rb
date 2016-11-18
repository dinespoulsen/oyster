require_relative "journey.rb"

class JourneyLog
attr_accessor :journey
attr_reader :journeys

  def initialize
    @journey
    @journeys = []
  end

  def start(station, journey_klass = Journey)
    self.journey = journey_klass.new
    journey.save_entry(station)
  end

  def finish(exit_station)
    current_journey(exit_station)
    save_journey
  end

  def reset_journey
    self.journey = nil
  end

  def in_journey?
    !journey.nil?
  end


private

  def current_journey(station)
    start(station) if journey.nil?
    journey.save_exit(station)
  end

  def save_journey
    journeys << journey
  end



end
