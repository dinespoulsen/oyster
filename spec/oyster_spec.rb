require 'oyster'




describe Oyster do
  subject(:card) {described_class.new}
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  describe "Balance" do
    it "should display zero when object is initialized" do
      expect(card.balance).to eq 0
    end

    context "when the balance exceeds its limits, should raise an error" do

      it "if there less balance then minimum journey fare, and we touch in" do
        card.top_up(0.5)
        message = "You're poor, go and top up"
        expect{card.touch_in(entry_station)}.to raise_error(message)
      end

      it " if we add more than 90 to the balance" do
        message = "The limit for topping up is 90 pounds"
        expect{card.top_up(91)}.to raise_error(message)
      end

    end
  end

  describe "will change, " do
    before(:each) {card.top_up(10)}
    it "should add 10 to the balance" do
      expect(card.balance).to eq 10
    end
  end

  describe "When checking card status" do
    before(:each) {card.top_up(10)}

    it "should return name of the start station when on journey" do
      card.touch_in(entry_station)
      expect(card.journey.entry_station).to eq entry_station
    end

    it "should deduct minimum fare from the balance when checking out" do
      card.touch_in(entry_station)
      expect{card.touch_out(entry_station)}.to change{card.balance}.by(-1)
    end

    it "journey status should be reset to nil after touch_out" do
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.journey).to be nil
    end

  end

  describe "Penalty fares" do
    it "should assign a fare if there is a touch out without touch in" do
      expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Journey::PENALTY_FARE)
    end


  end

  describe "To keep history of journeys" do
    before(:each) {card.top_up(10)}

    it "should take station as a variable when touching in" do
      expect(card).to respond_to(:touch_in).with(1).argument
    end

    it "should have an empty list of journeys by default" do
      expect(card.history).to be_empty
    end

    it "should store a journey" do
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.history.count).to eq 1
    end
  end

end
