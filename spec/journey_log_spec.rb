require "journey_log"

describe JourneyLog do

  let (:journey_log) {described_class.new}
  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}

describe "starting a journey creates a new instance of Journey" do
  it "start creates a new instance of journey" do
    expect(journey_log.start(entry_station)).to be_an_instance_of Journey
  end

  it "a journey starts with an entry station" do
    journey_log.start(entry_station)
    expect(journey_log.journey.entry_station).to eq entry_station
  end

  it "current_journey should return an incomplete journey" do
    journey_log.start(entry_station)
    expect(journey_log.current_journey(entry_station)).to eq journey_log.journey
  end

  it "current journey starts a new journey if there is none" do
    journey_log.current_journey(entry_station)
    expect(journey_log.journey).to be_an_instance_of Journey
  end

  describe "list of previous journeys" do
    it "journeys returns a list of all the previous journeys" do
      journey_log.start(entry_station)
      journey_log.finish(exit_station)
      expect(journey_log.journeys.count).to eq 1
    end

    it "should have an empty list of journeys by default" do
      expect(journey_log.journeys).to be_empty
    end

  end

end



end
