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
  self.journey = Journey.new(station)
  message = "You're poor, go and top up"
  fail message if self.balance < MINIMUM_FARE
end

def touch_out(station)
  deduct()
  journey.exit(station)
  save_history
end



private

def save_history
  history << self.journey
end

def deduct(money = MINIMUM_FARE)
  self.balance -= money
end

def max_capacity?(money)
  balance + money > MAX_CAPACITY
end

end
