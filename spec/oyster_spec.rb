require 'oyster'


describe Oyster do
  subject(:card) {described_class.new}
  let(:station) {double(:station)}
  let(:station2) {double(:station)}

    it "should take station as a variable when touching in" do
      expect(card).to respond_to(:touch_in).with(1).argument
    end

  describe "Balance" do

    it "should display zero when object is initialized" do
      expect(card.balance).to eq 0
    end

    context "when the balance exceeds its limits, should raise an error" do

      it "if there less balance then minimum journey fare, and we touch in" do
        card.top_up(0.5)
        message = "You're poor, go and top up"
        expect{card.touch_in(station)}.to raise_error(message)
      end

      it " if we add more than 90 to the balance" do
        message = "The limit for topping up is 90 pounds"
        expect{card.top_up(91)}.to raise_error(message)
      end
    end

    context "will change, " do
      before(:each) {card.top_up(10)}
      it "should add 10 to the balance" do
        expect(card.balance).to eq 10
      end

      it "should deduct minimum fare from the balance when checking out" do
        card.touch_in(station)
        expect{card.touch_out(station)}.to change{card.balance}.by(-1)
      end

    end
  end
end
