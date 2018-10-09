class Oystercard

  attr_reader :balance

  LIMIT = 90
  MINIMUM = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    raise "Unable to top up, maximum #{LIMIT}" if @balance + amount >= LIMIT
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds - less then #{MINIMUM}" if @balance < MINIMUM
    @in_journey = true
  end

  def touch_out(amount)
    @in_journey = false
    deduct(amount)
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
