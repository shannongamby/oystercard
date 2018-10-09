class Oystercard

  attr_reader :balance, :location

  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
    @location = nil
    @journey_history = {}
  end

  def top_up(amount)
    raise "Unable to top up, maximum #{LIMIT}" if @balance + amount >= LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Insufficient funds - less then #{MINIMUM}" if @balance < MINIMUM
    @in_journey = true
    @location = station
    @journey_history[:entry] = station
  end

  def touch_out(station, amount)
    @in_journey = false
    deduct(amount)
    @location = nil
    @journey_history[:exit] = station
  end

  def journey_history
    if @journey_history.empty?
      "No journeys yet"
    else
      "entry: #{@journey_history[:entry]}, exit: #{@journey_history[:exit]}"
    end
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
