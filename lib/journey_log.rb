require_relative 'journey'

#Manages the journeys
class JourneyLog

  attr_reader :journey_klass, :journeys
  attr_accessor :journey

  def initialize(journey_klass = Journey)

    @journey
    @journey_klass = journey_klass
    @journeys = []

  end


  def start(station)
     self.journey = journey_klass.new(station)
  end

  def finish(station)
    journey.exit_at(station)
    save_journey
    reset_journey
  end


  def current_journey(station)
    start(station) if journey.nil?
    journey
  end

  def save_journey
    journeys << journey
  end

  def journey_started?
    !journey.nil?
  end

  def reset_journey
      self.journey = nil
  end

end
