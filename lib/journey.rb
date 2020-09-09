class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
  end

private
  def in_journey?
    @entry_station != nil ? true : false
  end

end
