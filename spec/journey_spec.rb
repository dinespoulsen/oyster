require 'journey'

describe Journey do

subject(:journey) {described_class.new}
let(:station) { double(:station) }
let(:station2) { double(:station) }

  context "To keep history of journeys" do

    it "assigns the station to entry station" do
      journey.save_entry(station)
      expect(journey.entry_station).to eq station
    end

    it "assigns the station to exit station" do
      journey.save_exit(station2)
      expect(journey.exit_station).to eq station2
    end

end

  context "when beginning the journey" do


    it "the entry station is nil by default" do

      expect(journey.entry_station).to eq nil
    end

    it "the exit station is nil by default" do
      expect(journey.exit_station).to eq nil
    end

  end

  context "when calculating the cost of a journey" do

    it "returns the penalty fare whilst the journey is incomplete" do
      journey.save_entry(station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns the minimum fare when journey complete" do
      journey.save_entry(station)
      journey.save_exit(station2)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

  end

end
