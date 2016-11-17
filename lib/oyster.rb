require_relative "journey"

class Oyster
attr_reader :history
attr_accessor :balance, :journey
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90
MINIMUM_FARE = 1

 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @history = []
   @journey
 end

def top_up(money)
  fail max_balance_message if max_capacity?(money)
  self.balance += money
end

def touch_in(station, journey_klass = Journey)
  fail poor_message if self.balance < MINIMUM_FARE
  if !journey.nil?
    deduct(Journey::PENALTY_FARE)
  else
    self.journey = journey_klass.new
    journey.entry_at(station)
  end


end

def touch_out(station)
  if journey.nil?
    deduct(Journey::PENALTY_FARE)
  else
    save_journey(station)
    deduct(journey.fare)
    self.journey = nil
  end
end



private

def poor_message
message = "You're poor, go and top up"
end

def max_balance_message
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
end

def save_journey(station)
  journey.exit_at(station)
  history << self.journey
end

def deduct(money = MINIMUM_FARE)
  self.balance -= money
end

def max_capacity?(money)
  balance + money > MAX_CAPACITY
end

end
