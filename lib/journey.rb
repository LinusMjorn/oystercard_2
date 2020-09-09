class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    complete? ? MINIMUM_FARE : PENALTY_FARE
  end

  def complete?
    @entry_station != nil && @exit_station != nil ? true : false
  end

private
  def in_journey?
    @entry_station != nil ? true : false
  end

end
