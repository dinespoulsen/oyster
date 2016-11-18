require "journey_log"
#require "journey"


describe JourneyLog do
  subject(:journey_log) {described_class.new}
  let(:station) {double(:station)}
  let(:exit_station) {double(:station)}

  describe "Will manage journeys" do
    it "should be an instance of journey_log" do
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

    it "stores a journey when finishing the journey" do
      journey_log.start(station)
      journey_log.finish(exit_station)
      expect(journey_log.journeys.count).to eq 1
    end

  end

end
