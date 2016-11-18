require "journey_fare"

describe JourneyFare do

  subject(:journey_fare) {described_class.new}

  describe "creates a journey price" do
    it "should return minimum fare price" do
      expect(journey_fare.price).to eq 1
    end


    it "should calculate the fare price" do
      expect(journey_fare.calculate_fare).to eq 1
    end
  end

end
