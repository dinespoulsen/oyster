require './lib/journey.rb'
require './lib/journey_log.rb'

class Oyster

attr_reader :balance, :journey_log

DEFAULT_BALANCE = 0
MAX_CAPACITY = 90

 def initialize(balance = DEFAULT_BALANCE, journey_log_klass = JourneyLog)
   @balance = balance
   @journey_log = journey_log_klass.new
 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  @balance += money
end

def touch_in(station)
  message = "You're poor, go and top up"
  fail message if @balance < Journey::MINIMUM_FARE
  deduct(Journey::PENALTY_FARE) if journey_log.in_journey?
  journey_log.start(station)
end

def touch_out(station)
  if !journey_log.in_journey?
    deduct(journey_log.journey.fare)
  else
    journey_log.finish(station)
    deduct(journey_log.journey.fare)
    journey_log.reset_journey
  end
end

private

def deduct(money = Journey::MINIMUM_FARE)
  @balance -= money
end

def max_capacity?(money)
  @balance + money > MAX_CAPACITY
end

end
