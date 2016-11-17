require 'journey'

describe Journey do

  # it "returns minimum fare" do
  #   expect(subject.fare).to eq Journey::MINIMUM_FARE
  # end
  it "should return penalty fare if no exit journey" do
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "should return the minimum fare if exit is valid" do
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

end
