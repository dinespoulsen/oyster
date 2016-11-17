require 'journey'

describe Journey do

  let (:journey) {described_class.new}
  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}

  # it "returns minimum fare" do
  #   expect(subject.fare).to eq Journey::MINIMUM_FARE



  # end
  describe "assigning the correct fare" do

    it "should return penalty fare if no exit journey" do
      allow(journey).to receive(:in_journey?).and_return(false)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "should return the minimum fare if exit is valid" do
      allow(journey).to receive(:in_journey?).and_return(true)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end

  end

  describe "checking in_journey?" do
    it "in journey should return true when the journey is incomplete" do
      journey.entry_at(entry_station)
      expect(journey.in_journey?).to be true
    end

    it "in journye should return false when the journey is complete " do
      expect(subject.in_journey?).to be false
    end
  end

  describe "checking that entry station returns the entry station" do
    it "entry_at returns the entry station" do
      expect(journey.entry_at(entry_station)).to eq entry_station
    end

  end

  describe "checking that exit station returns the exit station" do
    it "exit_at returns the exit station" do
      expect(journey.exit_at(exit_station)).to eq exit_station
    end
  end




end
