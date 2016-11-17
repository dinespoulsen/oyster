require_relative "journey"

class Oyster
attr_reader :history, :journey_log
attr_accessor :balance, :journey
DEFAULT_BALANCE = 0
MAX_CAPACITY = 90
MINIMUM_FARE = 1

 def initialize(balance = DEFAULT_BALANCE, journey_log_klass = JourneyLog)
   @balance = balance
   @journey_log = journey_log_klass.new
 end

def top_up(money)
  fail max_balance_message if max_capacity?(money)
  self.balance += money
end

def touch_in(station)
  fail poor_message if self.balance < MINIMUM_FARE
  if journey_log.journey_started?
    penalty
    journey_log.current_journey(station)
  else
    journey_log.current_journey(station)
  end
end

def touch_out(station)
  if !journey_log.journey_started?
    penalty
  else
    deduct(journey_log.journey.fare)
    journey_log.finish(station)
  end
end



private

def penalty
  deduct(Journey::PENALTY_FARE)
end


def poor_message
message = "You're poor, go and top up"
end

def max_balance_message
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
end


def deduct(money = MINIMUM_FARE)
  self.balance -= money
end

def max_capacity?(money)
  balance + money > MAX_CAPACITY
end

end
