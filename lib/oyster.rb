require './lib/journey.rb'

class Oyster

attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history

attr_accessor :journey

DEFAULT_BALANCE = 0
MAX_CAPACITY = 90

 def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @journey
   @journey_history = []

 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  @balance += money
end

def touch_in(station, journey_klass=Journey)
  self.journey = journey_klass.new
  message = "You're poor, go and top up"
  fail message if @balance < Journey::MINIMUM_FARE
  journey.save_entry(station)
end

def touch_out(station)
  deduct()
  journey.save_exit(station)
  save_history
  self.journey = nil
end

private


def save_history
  @journey_history << journey
end

def deduct(money = Journey::MINIMUM_FARE)
  @balance -= money
end

def max_capacity?(money)
  @balance + money > MAX_CAPACITY
end

end
