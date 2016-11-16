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
   @journey = nil
 end

def top_up(money)
  message = "The limit for topping up is #{MAX_CAPACITY} pounds"
  fail message if max_capacity?(money)
  self.balance += money
end

def touch_in(station)
  message = "You're poor, go and top up"
  fail message if self.balance < MINIMUM_FARE
  self.journey = Journey.new
  journey.entry_at(station)
end

def touch_out(station)
  journey.exit_at(station)
  save_journey
  deduct(journey.fare)
end



private

def save_journey
  history << self.journey
end

def deduct(money = MINIMUM_FARE)
  self.balance -= money
end

def max_capacity?(money)
  balance + money > MAX_CAPACITY
end

end
