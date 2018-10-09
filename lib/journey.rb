class Journey

  attr_reader :entry_station, :journey_history

  def initialize
    @entry_station = nil
    @journey_history = {}
  end

  def journey_history?
    if @journey_history.empty?
      "No journeys yet"
    else
      "entry: #{@journey_history[:entry]}, exit: #{@journey_history[:exit]}"
    end
  end

  def touch_in(station)
    @entry_station = station
    @journey_history[:entry] = station
  end

  def touch_out(station)
    @journey_history[:exit] = station
    @entry_station = nil
  end

  end
