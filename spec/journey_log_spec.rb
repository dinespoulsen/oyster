require "journey_log"
#require "journey"


describe JourneyLog do
  subject(:journey_log) {described_class.new}
  let(:station) {double(:station)}

  describe "Will manage journeys" do
    it "should be an instance of joueny_log" do
      expect(journey_log).to be_an_instance_of(JourneyLog)
    end

    it "should be able to create a journey" do
      journey_log.start(station)
      expect(journey_log.journey).not_to be_nil
    end

    it "should be able to create a journey" do
      journey_log.start(station)
      expect(journey_log.journey).to be_an_instance_of(Journey)
    end

    it "should be able to create a journey with an entry station" do
      journey_log.start(station)
      expect(journey_log.journey.entry_station).to eq station
    end
  end

end
