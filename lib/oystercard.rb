require_relative 'journey'
class Oystercard

  attr_reader :balance

  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0)
    @balance = balance
    @journey = Journey.new
  end

  def top_up(amount)
    raise "Unable to top up, maximum #{LIMIT}" if @balance + amount >= LIMIT
    @balance += amount
  end

  def in_journey?
    @journey.entry_station == nil ? false : true
  end

  def touch_in(station)
    raise "Insufficient funds - less then #{MINIMUM}" if @balance < MINIMUM
    @journey.touch_in(station)
  end

  def touch_out(station, amount)
    deduct(amount)
    @journey.touch_out(station)
  end

  def journey_history
    @journey.journey_history?
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
